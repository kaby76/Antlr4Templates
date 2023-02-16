﻿// Template generated code from Antlr4Templates v6.0
namespace TemplateNamespace
{
    using Antlr4.Runtime;
    using System.Text;

    public class Program
    {
        static void Main(string[] args)
        {
            Try("1 + 2 + 3");
            Try("1 2 + 3");
            Try("1 + +");
        }

        static void Try(string input)
        {
            var str = new AntlrInputStream(input);
            System.Console.WriteLine(input);
            var lexer = new ArithmeticLexer(str);
            var tokens = new CommonTokenStream(lexer);
            var parser = new ArithmeticParser(tokens);
            var listener_parser = new ErrorListener();
	    parser.RemoveErrorListeners();
            parser.AddErrorListener(listener_parser);
            var tree = parser.file();
            if (listener_parser.had_error)
                System.Console.WriteLine("error in parse.");
            else
                System.Console.WriteLine("parse completed.");
        }

        static string ReadAllInput(string fn)
        {
            var input = System.IO.File.ReadAllText(fn);
            return input;
        }
    }
}
