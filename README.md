# Antlr4Templates

This package is a third-party set of templates for generating Antlr4
programs using the Arithmetic.g4 grammar.
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
    dotnet run

## Available templates

* `csharp-combine`: unified Arithmetic grammar for C#.
* `csharp-split`: split Arithmetic grammar for C#.
* `antlr4cs-combine`: unified Arithmetic grammar for C# using the Antlr4cs fork.
* `antlr4cs-split`: split Arithmetic grammar for C# using the Antlr4cs fork.
* `cpp-combine`: unified Arithmetic grammar for C++.
* `cpp-split`: split Arithmetic grammar for C++.
* `java-combine`: unified Arithmetic grammar for Java.
* `java-split`: split Arithmetic grammar for Java.

To see the complete list of templates, type `dotnet new --list | grep '[-]combine\|[-]split'` in Bash.

These templates have been tested and work with MSYS2 for Windows 11 using NET6,
and Linux. All apps are console programs that take no program arguments and output
a parse for various strings, some that are not correct in order to demonstrate parse
errors.

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
