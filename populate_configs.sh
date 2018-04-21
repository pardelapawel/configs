#!/bin/bash

# Copies all scripts to $HOME (with '.' prepended)
# stores your files as backup :)
# Asks for every file!

# Skpis this file


set -euo pipefail

this_script=$(realpath "$0")
this_readme=$(realpath "README.md")

my_home="${HOME}"

if [ -z my_home ]; then
    echo "Looks like your HOME is empty..."
    echo "I don't know ow to handle that"
    exit 1
fi

for file_name in *; do
    file_path=$(realpath "${file_name}")
    file_base=$(basename "${file_name}")
    copy_name=".${file_base}"
    copy_path="${my_home}/${copy_name}"

    if [[ "${file_path}" == "${this_script}" ||  "${file_path}" == "${this_readme}" ]]; then
        echo "Skipping '${file_name}'"
        continue
    fi

    echo
    confirmation_msg="Do you want to move '${file_name}' to '${copy_path}'? [y/N]"
    read -p "${confirmation_msg}" -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then

        if [[ -f "${copy_path}" ]]; then
            backup_file=$(mktemp ${copy_path}.XXXXXX)
            echo "File '${copy_name}' already exists in '${my_home}'"
            echo "Backup created here: '${backup_file}'"
            echo
        fi

        mv "${file_path}" "${copy_path}"
        echo "Moved ${file_path}" to "${copy_path}"
    fi
done

