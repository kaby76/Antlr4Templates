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
    cwd=`pwd`
    cwd=`cygpath -m "$cwd"`
    cwd=`echo $cwd | sed 's%^/c%c:%'`
else
    cwd=`pwd`
fi
echo "$machine"
echo "$cwd"
dotnet new -u "$cwd/csharp-combine"
dotnet new -u "$cwd/csharp-split"
dotnet new -u "$cwd/antlr4cs-combine"
dotnet new -u "$cwd/antlr4cs-split"
dotnet new -u "$cwd/java-combine"
dotnet new -u "$cwd/java-split"
dotnet new -u "$cwd/cpp-combine"
dotnet new -u "$cwd/cpp-split"
