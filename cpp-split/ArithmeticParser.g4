// Template generated code from Antlr4Templates v6.0

parser grammar ArithmeticParser;

options { tokenVocab = ArithmeticLexer; }

file : expression (SEMI expression)* EOF;
expression : expression POW expression | expression (TIMES | DIV) expression | expression (PLUS | MINUS) expression | LPAREN expression RPAREN | (PLUS | MINUS)* atom ;
atom : scientific | variable ;
scientific : SCIENTIFIC_NUMBER ;
variable : VARIABLE ;
