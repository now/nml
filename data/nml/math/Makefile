xslt = xsltproc

all: test

test: math
	$(xslt) $(XSLTOPTS) math-parser.xsl test/1.xml

math: math-parser.xsl math-lexer.xsl

math-parser.xsl: fixed-math-grammar.xml
	$(xslt) yapp/generator.xsl $< > $@

math-lexer.xsl: fixed-math-grammar.xml
	$(xslt) yapp/tokenizer.xsl $< > $@

fixed-math-grammar.xml: math-grammar.xml
	$(xslt) yapp/eliminator.xsl $< > $@

math-grammar.xml: math-grammar.bnf
	$(xslt) yapp/bnf-parser.xsl $< > $@

clean:
	rm -f math-grammar.xml fixed-math-grammar.xml math-lexer.xsl math-parser.xsl
