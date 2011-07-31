xslt = xsltproc

all: bnf

bnf: bnf-parser.xsl bnf-lexer.xsl

bnf-parser.xsl: generator.xsl bnf-grammar.xml
	$(xslt) generator.xsl bnf-grammar.xml > bnf-parser.xsl

bnf-lexer.xsl: tokenizer.xsl bnf-grammar.xml
	$(xslt) tokenizer.xsl bnf-grammar.xml > bnf-lexer.xsl

clean:
	rm -f bnf-lexer.xsl bnf-parser.xsl
