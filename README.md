# Antlr4Templates

This package is a third-party set of templates for generating Antlr4 C# programs.
A generated program contains:
* a grammar for expressions.
* a simple console program for parsing input.

To use this package, you will need to install NET 6.
Older versions are supported if
you modify the `<TargetFramework>` element in the
generated .csproj file.

## To install:

    dotnet new -i Antlr4Templates

## To create an Antlr C# program:

    mkdir Foo
    cd Foo
    dotnet new antlr
    dotnet restore
    dotnet build
    dotnet run

## Available templates

* `antlr4`: a simple console program with a unified Antlr4 grammar.
* `antlr4-split`: a simple console program with a split Antlr4 grammar.
* `antlr4cs`: a simple console program with a unified Antlr4 grammar using the Antlr4cs fork.
* `antlr4cs-split`: a simple console program with a split Antlr4 grammar using the Antlr4cs fork.

___NB: Antlr4cs is an obsolete fork of the "official" Antlr4 tool and runtime for CSharp.
The fork has numerous bugs in the build rules and the generated code
does not have a lexer error listener override.
It is supported here only as a convenience.___

## To uninstall:

    dotnet new -u Antlr4Templates

## Alternative generator

If you are interested in generating a parser from a grammar,
or for a target other than CSharp,
use [trgen](https://github.com/kaby76/Domemtech.Trash/tree/main/trgen).
