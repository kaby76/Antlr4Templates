#!/bin/bash

# Adjust version in the template package.
version="3.0"
files=`find . -name '*.csproj' | grep -v '[.]git/'`
subset=`grep -l -e "<PackageVersion>" $files`
for i in $subset
do
	cat $i | sed -e "s%<PackageVersion>[0-9]*[.][0-9]*</PackageVersion>%<PackageVersion>$version</PackageVersion>%" > asdfasdf; mv asdfasdf $i
done

# Adjust version in templates.
files=`find . -type f | grep -v '[.]git/' | grep '[-]split\|[-]combine'`
for i in $files
do
	cat $i | sed -e "s%Template generated code from Antlr4Templates v[0-9]*[.][0-9]*%Template generated code from Antlr4Templates v$version%" > asdfasdf; mv asdfasdf $i
done
