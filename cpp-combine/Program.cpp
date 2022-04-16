// Template generated code from Antlr4Templates v2.2

#include <iostream>
#include <string>
#include <chrono>
#include <atomic>
#include "ANTLRInputStream.h"
#include "ErrorListener.h"
#include "ArithmeticParser.h"
#include "ArithmeticLexer.h"

int Try(const std::string & input)
{
    antlr4::CharStream* str = nullptr;
    str = new antlr4::ANTLRInputStream(input);
    antlr4::Lexer * lexer = new ArithmeticLexer(str);
    auto tokens = new antlr4::CommonTokenStream(lexer);
    auto * parser = new ArithmeticParser(tokens);
    auto listener_lexer = new ErrorListener();
    auto listener_parser = new ErrorListener();
    lexer->removeErrorListeners();
    parser->removeErrorListeners();
    lexer->addErrorListener(listener_lexer);
    parser->addErrorListener(listener_parser);
    auto tree = parser->file();
    if (listener_parser->had_error || listener_lexer->had_error)
    {
        std::cerr << "Parse failed." << std::endl;
    }
    else
    {
        std::cerr << "Parse succeeded." << std::endl;
    }
    return 0;
}

int main(int argc, const char * argv[])
{
	Try("1 + 2 + 3");
	Try("1 2 + 3");
	Try("1 + +");
}
