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
    dotnet new csharp-combine
    dotnet restore
    dotnet build
    dotnet run

## Available templates

* `csharp-combine`: a simple console program with a unified Antlr4 grammar.
* `csharp-split`: a simple console program with a split Antlr4 grammar.
* `antlr4cs-combine`: a simple console program with a unified Antlr4 grammar using the Antlr4cs fork.
* `antlr4cs-split`: a simple console program with a split Antlr4 grammar using the Antlr4cs fork.

Templates also exist for Java and Cpp targets. To see the list, type `dotnet new --list | grep '[-]combine\|[-]split'` in Bash.

NB: Antlr4cs (in nuget
[here](https://www.nuget.org/packages/Antlr4/),
[here](https://www.nuget.org/packages/Antlr4.Runtime/),
and [here](https://www.nuget.org/packages/Antlr4.CodeGenerator/);
source [here](https://github.com/tunnelvisionlabs/antlr4cs)) is an obsolete fork of the "official" Antlr4 tool and runtime for CSharp.
The Antlr4cs fork has many problems, and it is not being maintained:

* Build rule problems
    * CSC : warning CS2002: Source file 'C:\msys64\home\Kenne\te\obj\Debug\net6.0\ArithmeticBaseVisitor.cs' specified multiple times [C:\msys64\home\Kenne\te\te.csproj]
    * `<CustomToolNamespace>` element in .csproj is not displayed correctly in VS IDE settings.
* There is no lexer error listener override because it is not supported by the runtime. The source code was updated to be netstandard2.0 in Dec 2020, but it was not compiled and released since Dec 2018!

It is supported here only as a convenience.

## To uninstall:

    dotnet new -u Antlr4Templates

## Alternative generator

If you are interested in generating a parser from a grammar,
or for a target other than CSharp,
use [trgen](https://github.com/kaby76/Domemtech.Trash/tree/main/trgen).
