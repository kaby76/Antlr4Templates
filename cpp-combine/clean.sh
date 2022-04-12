#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=Msys;;
    *)          machine="UNKNOWN:${unameOut}"
esac
if [[ "$machine" == "MinGw" || "$machine" == "Msys" ]]
then
    cwd=`pwd`
    cwd=`cygpath -m "$cwd"`
    cwd=`echo $cwd | sed 's%^/c%c:%'`
elif [[ "$machine" == "UNKNOWN:${unameOut}" ]]
then
    echo "$machine"
    echo "Cannot build because we do not know what the machine is."
    exit 1
else
    cwd=`pwd`
fi
echo "$machine"
echo "$cwd"

rm -rf build
rm -rf /tmp/antlr4_runtime
