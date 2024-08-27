import json
from collections import defaultdict
import subprocess
import os
import argparse
import hashlib

OUTPUT_ALL_FIELD = r"./out/all_field_?.sarif"
OUTPUT_ALL_DECLARE = r"./out/all_declare_?.sarif"
OUTPUT_ALL_PRUNING = r"./out/all_pruning_?.sarif"
OUTPUT_ALL_SELECT = r"./out/all_select_?.sarif"


def hash_string(target: str):
    return ''.join(map(lambda x: '%.3d' % ord(x), target))


def load_sarif_results(file_path):
    with open(file_path, "r") as f:
        raw_data = json.load(f)
    return list(map(lambda x: (x['message']['text'], x['locations'][0]['physicalLocation']['region']),
                    raw_data['runs'][0]['results']))


def filter_deepest_paths(selected_fields):
    # group by startLine
    grouped_by_line = defaultdict(list)
    for field, region in selected_fields:
        grouped_by_line[region['startLine']].append((field, region))

    # keep only the most specific/deep path
    filtered_fields = set()
    for start_line, fields in grouped_by_line.items():
        fields.sort(key=lambda x: len(x[0].split('.')), reverse=True)
        filtered_fields.add(fields[0][0])

    return filtered_fields


def collect():
    if os.path.exists(OUTPUT_ALL_FIELD.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_DECLARE.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_PRUNING.replace('?', hash_string(args.src))) and \
            os.path.exists(OUTPUT_ALL_SELECT.replace('?', hash_string(args.src))):
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
        f"--output={OUTPUT_ALL_SELECT.replace('?', hash_string(args.src))}",
        f"codeql database analyze ./database ./scripts/all_select.ql --format=sarifv2.1.0 "
        f"--output={OUTPUT_ALL_PRUNING.replace('?', hash_string(args.src))}"
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

    all_fields = set([item[0] for item in all_field_result])
    declared_fields = set([item[0] for item in all_declare_result])
    pruned_structs = set([item[0] for item in all_prune_result])

    selected_fields_post_processed = filter_deepest_paths(all_select_result)

    pruned_fields = set()
    for field in all_fields:
        for prune_struct in pruned_structs:
            if field.startswith(prune_struct):
                pruned_fields.add(field)

    remaining_fields = all_fields - declared_fields - selected_fields_post_processed - pruned_fields

    print("=" * 27)
    print("stat:\n"
          f"pruned fields #: {len(pruned_fields)}\n"
          f"selected fields #: {len(selected_fields_post_processed)}\n"
          f"declared fields #: {len(declared_fields)}\n"
          f"remaining fields #: {len(remaining_fields)}\n"
          f"all fields #: {len(all_fields)}")
    print("=" * 27)
    print(" " * 4 + "not accessed fields" + " " * 4)
    print("=" * 27)

    for field in sorted(remaining_fields):
        print(field)
    print("=" * 27)
