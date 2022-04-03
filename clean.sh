#!/bin/bash

rm -rf bin obj

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
echo "$machine"
echo "$cwd"

dotnet new -u "$cwd/csharp-combined"
dotnet new -u "$cwd/csharp-split"
dotnet new -u "$cwd/antlr4cs-combined"
dotnet new -u "$cwd/antlr4cs-split"
dotnet new -u "$cwd/java-combined"
dotnet new -u "$cwd/java-split"
