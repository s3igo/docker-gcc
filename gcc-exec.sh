#!/bin/bash

# parse options
args=$(getopt -o aewvh -l wall,wextra,warnings,verbose,help -- "$@") || exit 1
eval "set -- $args"

a_flag=0
e_flag=0
w_flag=0
v_flag=0
h_flag=0

while [ $# -gt 0 ]; do
    case $1 in
        -a | --wall) a_flag=1; shift;;
        -e | --wextra) e_flag=1; shift;;
        -w | --warnings) w_flag=1; shift;;
        -v | --verbose) v_flag=1; shift;;
        -h | --help) h_flag=1; shift;;
        --) shift; break ;;
    esac
done

# print help
if [ $# -eq 0 -o $h_flag -eq 1 ]; then
    echo "Usage: gcc-exec.sh [options] file"
    echo "Options:"
    echo "  -a, --wall      execute gcc with -Wall"
    echo "  -e, --wextra    execute gcc with -Wextra"
    echo "  -w, --warnings  execute gcc with -Wall -Wextra"
    echo "  -v, --verbose   remain binary file"
    echo "  -h, --help      print this help"
    exit 0
fi

# print error
if [ $# -ge 2 ]; then
    echo "Error: Too many arguments"
    exit 1
fi

# make options
options=""
if [ $w_flag -eq 1 ] || [ $a_flag -eq 1 -a $e_flag -eq 1 ]; then
    options="-Wall -Wextra"
elif [ $a_flag -eq 1 ]; then
    options="-Wall"
elif [ $e_flag -eq 1 ]; then
    options="-Wextra"
fi

# compile and execute
echo "compile: gcc $options $1"
if [ $v_flag -eq 1 ]; then
    eval "gcc $options $1 -o ${1%.*}" && ./${1%.*}
else
    eval "gcc $options $1 -o __tmp" && ./__tmp && rm -f ./__tmp
fi
