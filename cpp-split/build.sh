#!/bin/bash

unameOut="$(uname -s)"
sed 's%c:/temp%/tmp%g' cmake/ExternalAntlr4Cpp.cmake > asdf; mv asdf cmake/ExternalAntlr4Cpp.cmake;
case "${unameOut}" in
    Linux*)
	machine=Linux;
	;;	
    Darwin*)
	machine=Mac;
	;;
    CYGWIN*)
	machine=Cygwin;
	;;
    MINGW*)
	machine=MinGw;
	;;
    MSYS_NT*)
	machine=Msys;
	;;
    *)
	machine="UNKNOWN:${unameOut}"
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
target=""
curl https://repo1.maven.org/maven2/org/antlr/antlr4/4.10.1/antlr4-4.10.1-complete.jar -o antlr4-4.10.1-complete.jar
rm -rf build
mkdir build
cd build
cmake ..
make
