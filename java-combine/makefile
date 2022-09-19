# Template generated code from Antlr4Templates v4.0
JAR = M2DIR/antlr4-4.11.1-complete.jar
CLASSPATH = $(JAR)CONNECTOR.
.SUFFIXES: .g4 .java .class
.java.class:
	JAVACEXE -cp $(CLASSPATH) $*.java
ANTLRGRAMMARS ?= $(wildcard *.g4)
GENERATED = ArithmeticLexer.java ArithmeticParser.java
SOURCES = $(GENERATED) Program.java ErrorListener.java
default: M2DIR/antlr4-4.11.1-complete.jar classes
M2DIR/antlr4-4.11.1-complete.jar:
	cd M2DIR; wget https://repo1.maven.org/maven2/org/antlr/antlr4/4.11.1/antlr4-4.11.1-complete.jar
classes: $(GENERATED) $(SOURCES:.java=.class)
clean:
	rm -f *.class
	rm -f *.interp
	rm -f *.tokens
	rm -f $(GENERATED)
run:
	JAVAEXE -classpath $(CLASSPATH) Program
ArithmeticParser.java ArithmeticLexer.java : Arithmetic.g4
	JAVAEXE -jar $(JAR) -no-listener -encoding utf-8 Arithmetic.g4
