#!/usr/bin/env bash
# This file contains global helper functions that can be used in other bootstrap functions
# It can be imported by adding the following at the top of the script (as long as it's in the `bootstrap.d` directory)
# . "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)/.global.sh"

declare -A __COLORS=( \
    ["red"]="\e[1;31m" \
    ["orange"]="\e[1;33m" \
    ["green"]="\e[1;32m" \
    ["reset"]="\e[0m" \
)

function log() {
    # extract prefix
    local prefix="$1"

    # extract the rest of the arguments
    shift
    local args="$*"

    # set block color
    local color=${__COLORS["reset"]}
    case "${prefix,,}" in
        info)
            color=${__COLORS["green"]}
            ;;
        warn)
            color=${__COLORS["orange"]}
            ;;
        error)
            color=${__COLORS["red"]}
            ;;
        # special case - when there's no known prefix passed, default to INFO
        # in this case, rebuild the args and set defaults
        *)
            args="$prefix $args"
            prefix="info"
            color=${__COLORS["green"]}
            ;;
    esac

    # output formatted string
    caller_output=$(caller)
    caller_file=${caller_output##* }
    echo -e "${color}[${prefix^^}]${__COLORS['reset']} $(date '+%T.%3N')｜$(basename "$caller_file")\t${color}»${__COLORS['reset']} ${args}"
}

function isWSL() {
    if grep -qi Microsoft /proc/version; then
        return 0
    else
        return 1
    fi
}

