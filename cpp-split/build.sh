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
else
    cwd=`pwd`
fi
echo "$machine"
echo "$cwd"

case "${unameOut}" in
    Linux*)     target="";;
    Darwin*)    target="";;
    CYGWIN*)    target="";;
    MINGW*)     target="";;
    MSYS_NT*)   target="";;
esac

rm -rf build
mkdir build
cd build
cmake ..
#cmake .. -G "$target"
make
