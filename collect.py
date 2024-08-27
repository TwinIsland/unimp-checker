import subprocess
import os
import argparse

def main():
    parser = argparse.ArgumentParser(description="Kubernet Operator Field Access Checker.")
    parser.add_argument("src", type=str, help="The kubernet operator project directory.")
    args = parser.parse_args()

    subprocess.run(f"codeql database create database -s {args.src} --language=go --overwrite", shell=True)
    print("database creation completed.")

    os.makedirs("out", exist_ok=True)

    commands = [
        "codeql database analyze ./database ./scripts/all_field.ql --format=sarifv2.1.0 --output=./out/all_field.sarif",
        "codeql database analyze ./database ./scripts/all_declare.ql --format=sarifv2.1.0 --output=./out/all_declare.sarif",
        "codeql database analyze ./database ./scripts/all_pruning.ql --format=sarifv2.1.0 --output=./out/all_pruning.sarif",
        "codeql database analyze ./database ./scripts/all_select.ql --format=sarifv2.1.0 --output=./out/all_select.sarif"
    ]

    for command in commands:
        subprocess.run(command, shell=True)

    print("all analyses completed.")
    print("start post processing...")
    

if __name__ == "__main__":
    main()
