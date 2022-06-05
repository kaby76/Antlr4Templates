// Template generated code from Antlr4Templates v2.5
import java.io.FileNotFoundException;
import java.io.IOException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

public class Program
{
    public static void main(String[] args) throws  FileNotFoundException, IOException
    {
        Try("1 + 2 + 3");
        Try("1 2 + 3");
        Try("1 + +");
    }

    static void Try(String input)
    {
        CharStream str = CharStreams.fromString(input);
        System.out.println(input);
        ArithmeticLexer lexer = new ArithmeticLexer(str);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ArithmeticParser parser = new ArithmeticParser(tokens);
        ErrorListener listener_lexer = new ErrorListener();
        ErrorListener listener_parser = new ErrorListener();
        parser.removeErrorListeners();
        lexer.removeErrorListeners();
        parser.addErrorListener(listener_parser);
        lexer.addErrorListener(listener_lexer);
        var tree = parser.file();
        if (listener_lexer.had_error || listener_parser.had_error)
            System.out.println("error in parse.");
        else
            System.out.println("parse completed.");
        System.out.println(tree.toStringTree(parser));
    }
}
