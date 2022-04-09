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
echo "$machine"
echo "$cwd"

dotnet new -i "$cwd/csharp-combine"
dotnet new -i "$cwd/csharp-split"
dotnet new -i "$cwd/antlr4cs-combine"
dotnet new -i "$cwd/antlr4cs-split"
dotnet new -i "$cwd/java-combine"
dotnet new -i "$cwd/java-split"
dotnet new -i "$cwd/cpp-combine"
dotnet new -i "$cwd/cpp-split"
