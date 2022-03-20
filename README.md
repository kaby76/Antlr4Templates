# Antlr4Templates

This directory contains code for Antlr templates for C# .NET. The template
contains a grammar for expressions,
code to print out the Antlr parse trees and token stream.
You will need to install Dotnet.

## To install:

    dotnet new -i Antlr4Templates

## To create an Antlr C# program:

    mkdir Foo
    cd Foo
    dotnet new antlr
    dotnet restore
    dotnet build
    dotnet run

## To uninstall:

    dotnet new -u Antlr4Templates

## Alternative generator

If you are interested in generating a parser for a target other than
C#, use [trgen](https://github.com/kaby76/Domemtech.Trash/tree/main/trgen).