// Template generated code from Antlr4Templates v2.5

import java.io.FileNotFoundException;
import java.io.IOException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

public class ErrorListener extends ConsoleErrorListener
{
    public boolean had_error = false;
    
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer,
        Object offendingSymbol,
        int line,
        int charPositionInLine,
        String msg,
        RecognitionException e)
    {
        had_error = true;
        super.syntaxError(recognizer, offendingSymbol, line, charPositionInLine, msg, e);
    }
}
