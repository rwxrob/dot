#!/usr/bin/bash

# This snippet contains the scaffolding for Bash tab completion using
# the complete -C foo foo variation which allows scripts to complete
# themselves (rather than having another script somewhere to manage). To
# use it simply add a function with the additional command and add the
# name of it to the commands array declaration at the top of the script.
# Then add complete -C foo foo (or something like it) to your bashrc.

declare -a COMMANDS=(foo usage)
CMD="${1:-usage}"; shift 2>/dev/null

# ----------------------------- COMMANDS -----------------------------

foo() {
    echo "would foo"
}

usage() {
    local cmds="${COMMANDS[@]}"
    printf "usage: ${0##*/} (${cmds// /|})\n"
}

# ------------------------ complete -C foo foo -----------------------

for c in ${COMMANDS[@]}; do
    if [[ $c == $CMD ]]; then
        "$CMD" "$@"
        exit $?
    fi
done

if [[ -n $COMP_LINE ]]; then
    for c in ${COMMANDS[@]}; do 
        [[ ${c:0:${#1}} == $1 ]] && echo "$c"
    done
fi
