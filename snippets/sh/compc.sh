#!/usr/bin/bash

# This snippet contains the scaffolding for Bash tab completion using
# the complete -C foo foo variation which allows scripts to complete
# themselves (rather than having another script somewhere to manage). To
# use it simply add a function with the additional command and add the
# name of it to the commands array declaration at the top of the script.
# Then add complete -C foo foo (or something like it) to your bashrc.

declare -a commands=(usage)
subcmd="${1:-usage}"; shift 2>/dev/null

# ----------------------------- commands -----------------------------

usage() {
    printf "would print usage for: ${0##*/}\n"
}

# ------------------------ complete -C foo foo -----------------------

for i in ${commands[@]}; do
    if [[ "${i}" == "${subcmd}" ]]; then
        "${subcmd}" "$@"
        exit 0
    fi
done

if [ -n "${COMP_LINE}" ]; then
    for cmd in ${commands[@]}; do 
        [[ "${cmd:0:${#1}}" == "$1" ]] && echo "${cmd}"
    done
    exit 0
fi
