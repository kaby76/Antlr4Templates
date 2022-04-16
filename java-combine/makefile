# Template generated code from Antlr4Templates v2.2
JAR = antlr4-4.10-complete.jar
CLASSPATH = $(JAR)\;.
.SUFFIXES: .g4 .java .class
.java.class:
	javac -cp $(CLASSPATH) $*.java
ANTLRGRAMMARS ?= $(wildcard *.g4)
GENERATED = ArithmeticLexer.java ArithmeticParser.java
SOURCES = $(GENERATED) Program.java ErrorListener.java
default: antlr4-4.10-complete.jar classes
antlr4-4.10-complete.jar:
	curl https://repo1.maven.org/maven2/org/antlr/antlr4/4.10/antlr4-4.10-complete.jar -o ./antlr4-4.10-complete.jar
classes: $(GENERATED) $(SOURCES:.java=.class)
clean:
	rm -f *.class
	rm -f *.interp
	rm -f *.tokens
	rm -f $(JAR)
	rm -f $(GENERATED)
run:
	java -classpath $(CLASSPATH) Program
ArithmeticParser.java ArithmeticLexer.java : Arithmetic.g4
	java -jar $(JAR) -no-listener -encoding utf-8 Arithmetic.g4
