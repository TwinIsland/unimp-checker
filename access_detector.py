import json
from collections import defaultdict
import subprocess
import os
import argparse
import yaml

OUTPUT_ALL_FIELD = r"./out/all_field_?.sarif"
OUTPUT_ALL_DECLARE = r"./out/all_declare_?.sarif"
OUTPUT_ALL_PRUNING = r"./out/all_pruning_?.sarif"
OUTPUT_ALL_SELECT = r"./out/all_select_?.sarif"
OUTPUT_ALL_ROOT = r"./out/all_root_?.sarif"


def hash_string(target: str):
    return ''.join(map(lambda x: '%.3d' % ord(x), target))


def load_sarif_results(file_path):
    with open(file_path, "r") as f:
        raw_data = json.load(f)
    return list(map(lambda x: (x['message']['text'],
                               x['locations'][0]['physicalLocation']['region'],
                               x['locations'][0]['physicalLocation']['artifactLocation']['uri']),
                    raw_data['runs'][0]['results']))


def reconstruct_full_paths(selected_fields):
    # Group fields by their starting line
    group_by_loc = defaultdict(list)
    field_visited = {}
    for field_raw, region, uri in selected_fields:
        field = field_raw.split('|')[0]
        field_types = field_raw.split('|')[1]
        if uri + str(region['startLine']) not in field_visited:
            field_visited[str(uri + str(region['startLine']))] = []
        if field in field_visited[uri + str(region['startLine'])]:
            continue
        field_visited[uri + str(region['startLine'])].append(field)
        group_by_loc[uri + str(region['startLine'])].append((field, field_types, region))

    reconstructed_paths = set()
    path_type_table = {}

    for loc, fields in group_by_loc.items():
        fields.sort(key=lambda x: len(x[0][0].split('.')), reverse=True)

        reconstructed_path = []

        # Traverse upwards, adding the next intermediate paths
        for cur_field, cur_type, _ in fields[:-1]:
            reconstructed_path.insert(0, cur_field.split('.')[-1])

        reconstructed_path = fields[-1][0].split('.') + reconstructed_path
        reconstructed_path_str: str = '.'.join(reconstructed_path)

        reconstructed_paths.add(reconstructed_path_str)

    return reconstructed_paths


def collect():
    if os.path.exists(OUTPUT_ALL_FIELD.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_DECLARE.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_PRUNING.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_SELECT.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_ROOT.replace('?', hash_string(args.src))):
        return

    if not os.path.exists(args.src):
        raise Exception(f"{args.src} is not existed.")

    subprocess.run(f"codeql database create database -s {args.src} --language=go --overwrite", shell=True)
    print("database creation completed.")

    os.makedirs("out", exist_ok=True)

    commands = [
        f"codeql database analyze ./database ./scripts/all_field.ql --format=sarifv2.1.0 "
        f"--output={OUTPUT_ALL_FIELD.replace('?', hash_string(args.src))}",
        f"codeql database analyze ./database ./scripts/all_declare.ql --format=sarifv2.1.0 "
        f"--output={OUTPUT_ALL_DECLARE.replace('?', hash_string(args.src))}",
        f"codeql database analyze ./database ./scripts/all_pruning.ql --format=sarifv2.1.0 "
        f"--output={OUTPUT_ALL_PRUNING.replace('?', hash_string(args.src))}",
        f"codeql database analyze ./database ./scripts/all_select.ql --format=sarifv2.1.0 "
        f"--output={OUTPUT_ALL_SELECT.replace('?', hash_string(args.src))}",
        f"codeql database analyze ./database ./scripts/all_root.ql --format=sarifv2.1.0 "
        f"--output={OUTPUT_ALL_ROOT.replace('?', hash_string(args.src))}"
    ]

    for command in commands:
        subprocess.run(command, shell=True)

    print("all analyses completed.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Kubernet Operator Field Access Checker.")
    parser.add_argument("src", type=str, help="The kubernet operator project directory.")
    args = parser.parse_args()

    collect()

    print("start post processing...")

    all_field_result = load_sarif_results(OUTPUT_ALL_FIELD.replace('?', hash_string(args.src)))
    all_declare_result = load_sarif_results(OUTPUT_ALL_DECLARE.replace('?', hash_string(args.src)))
    all_prune_result = load_sarif_results(OUTPUT_ALL_PRUNING.replace('?', hash_string(args.src)))
    all_select_result = load_sarif_results(OUTPUT_ALL_SELECT.replace('?', hash_string(args.src)))
    all_root_result = load_sarif_results(OUTPUT_ALL_ROOT.replace('?', hash_string(args.src)))

    all_field_result_cleaned = []
    loc_table = {}

    for item in all_field_result:
        for root_struct_decl in list(map(lambda x: x[0], all_root_result)):
            if item[0].startswith(root_struct_decl):
                all_field_result_cleaned.extend(item[0].split('\n'))
                for i in item[0].split('\n'):
                    loc_table[i] = (item[2], item[1])
                break

    all_fields = set(all_field_result_cleaned)
    declared_fields = set([item[0] for item in all_declare_result])
    pruned_structs = set([item[0] for item in all_prune_result])

    selected_fields_post_processed = reconstruct_full_paths(all_select_result)

    # pprint.pp(all_select_result)
    # pprint.pprint(selected_fields_post_processed)
    # raise Exception

    pruned_fields = set()
    for field in all_fields:
        for prune_struct in pruned_structs:
            if field.startswith(prune_struct):
                pruned_fields.add(field)

    # remaining_fields = all_fields - declared_fields - selected_fields_post_processed - pruned_fields
    #
    accessed_fields = set()
    accessed_fields.update(declared_fields)
    accessed_fields.update(selected_fields_post_processed)
    accessed_fields.update(pruned_fields)

    remaining_fields = set()

    for item in all_fields:
        accessed = False
        for accessed_item in accessed_fields:
            if accessed_item.endswith(item):  # how controller-gen handle the nested struct in crd
                accessed = True
                break
        if not accessed:
            remaining_fields.add(item)

    print("=" * 27)
    print(" " * 4 + "not accessed fields" + " " * 4)
    print("=" * 27)
    for field in sorted(remaining_fields):
        print(f"'{field:<60}' {loc_table[field]}")
    print("=" * 27)
    print("stat:\n"
          f"pruned fields #: {len(pruned_fields)}\n"
          f"selected fields #: {len(selected_fields_post_processed)}\n"
          f"declared fields #: {len(declared_fields)}\n"
          f"remaining fields #: {len(remaining_fields)}\n"
          f"all fields #: {len(all_fields)}")
    print("=" * 27)
