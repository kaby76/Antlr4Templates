#!/bin/bash

dotnet restore
dotnet build

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
    cwd=`pwd | sed 's%/c%c:%' | sed 's%/%\\\\%g'`
else
    cwd=`pwd`
fi
list=`find . -maxdepth 1 -type d -name '*'`
echo $list
for i in $list
do
    j=$(basename $i)
    case "$j" in
        .*) continue;;
	bin) continue;;
	obj) continue;;
        *) dotnet new install "$cwd/$j";;
    esac
done
dotnet new list
exit 0
