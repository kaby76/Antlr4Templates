# Antlr4Templates

This package is a third-party set of templates for generating Antlr4 C# programs.
The template contains a grammar for expressions, a simple console program for parsing input,
and code to print out the Antlr parse tree and token stream.
You will need to install NET 6.

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
