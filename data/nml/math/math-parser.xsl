<?xml version="1.0" encoding="UTF-8"?>
<tns:stylesheet xmlns:tns="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.pingdynasty.com/namespaces/tokenizer" xmlns:p="http://www.pingdynasty.com/namespaces/parser" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:ignore="ignore" t:ignore="ignore" p:ignore="ignore" exclude-result-prefixes="exsl"><tns:import href="math-lexer.xsl"/><tns:output method="xml" indent="yes" encoding="UTF-8"/><!-- Templates for terminals --><tns:template name="p:end"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='end'"><term name="end"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:plus"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='plus'"><term name="plus"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:minus"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='minus'"><term name="minus"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:times"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='times'"><term name="times"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:div"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='div'"><term name="div"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:lbrace"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='lbrace'"><term name="lbrace"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:rbrace"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='rbrace'"><term name="rbrace"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><tns:template name="p:number"><tns:param name="in"/><tns:variable name="token"><tns:call-template name="t:nextToken"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:if test="exsl:node-set($token)/token/@type='number'"><term name="number"><tns:value-of select="exsl:node-set($token)/token"/></term><remainder><tns:value-of select="exsl:node-set($token)/remainder"/></remainder></tns:if></tns:template><!-- Templates for non-terminals --><!-- Construct: Start--><tns:template name="p:Start"><tns:param name="in"/><!-- Start -> Exp end --><tns:variable name="option-Exp-end"><!-- part Exp--><tns:variable name="part1"><tns:call-template name="p:Exp"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part end--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:end"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-Exp-end)/term) = 2"><term name="Start"><tns:copy-of select="exsl:node-set($option-Exp-end)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-Exp-end)/remainder[2]"/></remainder></tns:when><tns:otherwise/></tns:choose></tns:template><!-- Construct: Exp--><tns:template name="p:Exp"><tns:param name="in"/><!-- Exp -> Term Exp-rest --><tns:variable name="option-Term-Exp-rest"><!-- part Term--><tns:variable name="part1"><tns:call-template name="p:Term"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Exp-rest--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Exp-rest"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-Term-Exp-rest)/term) = 2"><term name="Exp"><tns:copy-of select="exsl:node-set($option-Term-Exp-rest)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-Term-Exp-rest)/remainder[2]"/></remainder></tns:when><tns:otherwise/></tns:choose></tns:template><!-- Construct: Exp-rest--><tns:template name="p:Exp-rest"><tns:param name="in"/><!-- Exp-rest -> plus Term Exp-rest --><tns:variable name="option-plus-Term-Exp-rest"><!-- part plus--><tns:variable name="part1"><tns:call-template name="p:plus"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Term--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Term"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/><!-- and part Exp-rest--><tns:variable name="part3"><tns:if test="exsl:node-set($part2)/remainder"><tns:call-template name="p:Exp-rest"><tns:with-param name="in" select="exsl:node-set($part2)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part3)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-plus-Term-Exp-rest)/term) = 3"><term name="Exp-rest"><tns:copy-of select="exsl:node-set($option-plus-Term-Exp-rest)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-plus-Term-Exp-rest)/remainder[3]"/></remainder></tns:when><tns:otherwise><!-- Exp-rest -> minus Term Exp-rest --><tns:variable name="option-minus-Term-Exp-rest"><!-- part minus--><tns:variable name="part1"><tns:call-template name="p:minus"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Term--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Term"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/><!-- and part Exp-rest--><tns:variable name="part3"><tns:if test="exsl:node-set($part2)/remainder"><tns:call-template name="p:Exp-rest"><tns:with-param name="in" select="exsl:node-set($part2)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part3)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-minus-Term-Exp-rest)/term) = 3"><term name="Exp-rest"><tns:copy-of select="exsl:node-set($option-minus-Term-Exp-rest)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-minus-Term-Exp-rest)/remainder[3]"/></remainder></tns:when><tns:otherwise><!-- Exp-rest -> --><term name="Exp-rest"/><remainder><tns:value-of select="$in"/></remainder></tns:otherwise></tns:choose></tns:otherwise></tns:choose></tns:template><!-- Construct: Term--><tns:template name="p:Term"><tns:param name="in"/><!-- Term -> Factor Term-rest --><tns:variable name="option-Factor-Term-rest"><!-- part Factor--><tns:variable name="part1"><tns:call-template name="p:Factor"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Term-rest--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Term-rest"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-Factor-Term-rest)/term) = 2"><term name="Term"><tns:copy-of select="exsl:node-set($option-Factor-Term-rest)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-Factor-Term-rest)/remainder[2]"/></remainder></tns:when><tns:otherwise/></tns:choose></tns:template><!-- Construct: Term-rest--><tns:template name="p:Term-rest"><tns:param name="in"/><!-- Term-rest -> times Factor Term-rest --><tns:variable name="option-times-Factor-Term-rest"><!-- part times--><tns:variable name="part1"><tns:call-template name="p:times"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Factor--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Factor"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/><!-- and part Term-rest--><tns:variable name="part3"><tns:if test="exsl:node-set($part2)/remainder"><tns:call-template name="p:Term-rest"><tns:with-param name="in" select="exsl:node-set($part2)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part3)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-times-Factor-Term-rest)/term) = 3"><term name="Term-rest"><tns:copy-of select="exsl:node-set($option-times-Factor-Term-rest)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-times-Factor-Term-rest)/remainder[3]"/></remainder></tns:when><tns:otherwise><!-- Term-rest -> div Factor Term-rest --><tns:variable name="option-div-Factor-Term-rest"><!-- part div--><tns:variable name="part1"><tns:call-template name="p:div"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Factor--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Factor"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/><!-- and part Term-rest--><tns:variable name="part3"><tns:if test="exsl:node-set($part2)/remainder"><tns:call-template name="p:Term-rest"><tns:with-param name="in" select="exsl:node-set($part2)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part3)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-div-Factor-Term-rest)/term) = 3"><term name="Term-rest"><tns:copy-of select="exsl:node-set($option-div-Factor-Term-rest)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-div-Factor-Term-rest)/remainder[3]"/></remainder></tns:when><tns:otherwise><!-- Term-rest -> --><term name="Term-rest"/><remainder><tns:value-of select="$in"/></remainder></tns:otherwise></tns:choose></tns:otherwise></tns:choose></tns:template><!-- Construct: Factor--><tns:template name="p:Factor"><tns:param name="in"/><!-- Factor -> number --><tns:variable name="option-number"><!-- part number--><tns:variable name="part1"><tns:call-template name="p:number"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-number)/term) = 1"><term name="Factor"><tns:copy-of select="exsl:node-set($option-number)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-number)/remainder[1]"/></remainder></tns:when><tns:otherwise><!-- Factor -> lbrace Exp rbrace --><tns:variable name="option-lbrace-Exp-rbrace"><!-- part lbrace--><tns:variable name="part1"><tns:call-template name="p:lbrace"><tns:with-param name="in" select="$in"/></tns:call-template></tns:variable><tns:copy-of select="exsl:node-set($part1)"/><!-- and part Exp--><tns:variable name="part2"><tns:if test="exsl:node-set($part1)/remainder"><tns:call-template name="p:Exp"><tns:with-param name="in" select="exsl:node-set($part1)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part2)"/><!-- and part rbrace--><tns:variable name="part3"><tns:if test="exsl:node-set($part2)/remainder"><tns:call-template name="p:rbrace"><tns:with-param name="in" select="exsl:node-set($part2)/remainder"/></tns:call-template></tns:if></tns:variable><tns:copy-of select="exsl:node-set($part3)"/></tns:variable><tns:choose><tns:when test="count(exsl:node-set($option-lbrace-Exp-rbrace)/term) = 3"><term name="Factor"><tns:copy-of select="exsl:node-set($option-lbrace-Exp-rbrace)/term"/></term><remainder><tns:value-of select="exsl:node-set($option-lbrace-Exp-rbrace)/remainder[3]"/></remainder></tns:when><tns:otherwise/></tns:choose></tns:otherwise></tns:choose></tns:template><!-- Templates from grammar -->

    <xsl:output xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="text()"/>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="m">
      <xsl:variable name="parsed">
        <xsl:call-template name="p:Start">
          <xsl:with-param name="in" select="."/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="true()">
          <xsl:variable name="grammar">
            <xsl:apply-templates select="exsl:node-set($parsed)/term" mode="rewrite"/>
          </xsl:variable>

          <xsl:apply-templates select="exsl:node-set($grammar)" mode="associate-exp"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="exsl:node-set($parsed)/term" mode="rewrite"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="term[*]" mode="rewrite">
      <xsl:element name="{@name}">
        <xsl:apply-templates mode="rewrite"/>
      </xsl:element>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="term" mode="rewrite">
      <xsl:element name="{@name}">
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="text()" mode="associate-exp"/>
    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="text()" mode="associate-exp-up"/>
    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="text()" mode="associate-term-up"/>

    <!-- TODO: Need to make sure that these only get applied to the subtree
    we’re working with.  That is, we only deal with the Exp right under the context node. -->
    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" name="find-innermost-term-rest">
      <xsl:param name="node"/>
      <xsl:param name="stop" select="$node"/>
      <xsl:choose>
        <xsl:when test="$node/Term-rest[count(*) = 0]">
          <xsl:apply-templates select="$node/*[1]" mode="associate-term-up"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="find-innermost-term-rest">
            <xsl:with-param name="node" select="$node/Term-rest"/>
            <xsl:with-param name="stop" select="$stop"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" name="find-innermost-exp-rest">
      <xsl:param name="node"/>
      <xsl:choose>
        <xsl:when test="$node/Exp-rest[count(*) = 0]">
          <xsl:apply-templates select="$node/*[1]" mode="associate-exp-up"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="find-innermost-exp-rest">
            <xsl:with-param name="node" select="$node/Exp-rest"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="/Start/Exp" mode="associate-exp">
      <xsl:call-template name="find-innermost-exp-rest">
        <xsl:with-param name="node" select="."/>
      </xsl:call-template>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="plus|minus" mode="associate-exp-up">
      <mml:apply>
        <xsl:element name="{concat('mml:', local-name(.))}"/>
        <xsl:apply-templates select="../../*[1]" mode="associate-exp-up"/>
        <xsl:apply-templates select="../*[2]" mode="associate-exp-up"/>
      </mml:apply>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="Term" mode="associate-exp-up">
      <xsl:call-template name="find-innermost-term-rest">
        <xsl:with-param name="node" select="."/>
      </xsl:call-template>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="times|div" mode="associate-term-up">
      <mml:apply>
        <xsl:element name="{concat('mml:', local-name(.))}"/>
        <xsl:apply-templates select="../../*[1]" mode="associate-term-up"/>
        <xsl:apply-templates select="../*[2]" mode="associate-term-up"/>
      </mml:apply>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="Factor/number" mode="associate-term-up">
      <mml:cn>
        <xsl:value-of select="."/>
      </mml:cn>
    </xsl:template>

    <xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/MathML" match="Factor/Exp" mode="associate-term-up">
      <xsl:call-template name="find-innermost-exp-rest">
        <xsl:with-param name="node" select="."/>
      </xsl:call-template>
    </xsl:template>
  </tns:stylesheet>
