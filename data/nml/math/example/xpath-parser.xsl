<?xml version="1.0" encoding="UTF-8"?>
<tns:stylesheet xmlns:tns="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.pingdynasty.com/namespaces/tokenizer" xmlns:p="http://www.pingdynasty.com/namespaces/parser" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:ignore="ignore" t:ignore="ignore" p:ignore="ignore" exclude-result-prefixes="exsl">
  <tns:import href="xpath-lexer.xsl"/>
  <tns:import href="xpath-templates.xsl"/>
  <tns:output method="xml" indent="yes" encoding="UTF-8"/>
  <!-- Templates for terminals -->
  <tns:template name="p:literal">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='literal'">
      <term name="literal">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:processingInstruction">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='processingInstruction'">
      <term name="processingInstruction">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:end">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='end'">
      <term name="end">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:ncname">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='ncname'">
      <term name="ncname">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:slash">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='slash'">
      <term name="slash">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:slashslash">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='slashslash'">
      <term name="slashslash">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:dot">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='dot'">
      <term name="dot">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:dotdot">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='dotdot'">
      <term name="dotdot">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:at">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='at'">
      <term name="at">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:colon">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='colon'">
      <term name="colon">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:lparen">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='lparen'">
      <term name="lparen">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:rparen">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='rparen'">
      <term name="rparen">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:lbrack">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='lbrack'">
      <term name="lbrack">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:rbrack">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='rbrack'">
      <term name="rbrack">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:asterisk">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='asterisk'">
      <term name="asterisk">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:or">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='or'">
      <term name="or">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:and">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='and'">
      <term name="and">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:div">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='div'">
      <term name="div">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:mod">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='mod'">
      <term name="mod">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:minus">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='minus'">
      <term name="minus">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:plus">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='plus'">
      <term name="plus">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:equalityOperator">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='equalityOperator'">
      <term name="equalityOperator">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:relationalOperator">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='relationalOperator'">
      <term name="relationalOperator">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:axisName">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='axisName'">
      <term name="axisName">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:comment">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='comment'">
      <term name="comment">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:text">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='text'">
      <term name="text">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="p:node">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:if test="exsl:node-set($token)/token/@type='node'">
      <term name="node">
        <tns:value-of select="exsl:node-set($token)/token"/>
      </term>
      <remainder>
        <tns:value-of select="exsl:node-set($token)/remainder"/>
      </remainder>
    </tns:if>
  </tns:template>
  <!-- Templates for non-terminals -->
  <!-- Construct: Expr-->
  <tns:template name="p:Expr">
    <tns:param name="in"/>
    <!-- Expr -> LocationPath end -->
    <tns:variable name="option-LocationPath-end">
      <!-- part LocationPath-->
      <tns:variable name="part1">
        <tns:call-template name="p:LocationPath">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
      <!-- and part end-->
      <tns:variable name="part2">
        <tns:if test="exsl:node-set($part1)/remainder">
          <tns:call-template name="p:end">
            <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
          </tns:call-template>
        </tns:if>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part2)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-LocationPath-end)/term) = 2">
        <term name="Expr">
          <tns:copy-of select="exsl:node-set($option-LocationPath-end)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-LocationPath-end)/remainder[2]"/>
        </remainder>
      </tns:when>
      <tns:otherwise/>
    </tns:choose>
  </tns:template>
  <!-- Construct: LocationPath-->
  <tns:template name="p:LocationPath">
    <tns:param name="in"/>
    <!-- LocationPath -> RelativeLocationPath -->
    <tns:variable name="option-RelativeLocationPath">
      <!-- part RelativeLocationPath-->
      <tns:variable name="part1">
        <tns:call-template name="p:RelativeLocationPath">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-RelativeLocationPath)/term) = 1">
        <term name="LocationPath">
          <tns:copy-of select="exsl:node-set($option-RelativeLocationPath)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-RelativeLocationPath)/remainder[1]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- LocationPath -> AbsoluteLocationPath -->
        <tns:variable name="option-AbsoluteLocationPath">
          <!-- part AbsoluteLocationPath-->
          <tns:variable name="part1">
            <tns:call-template name="p:AbsoluteLocationPath">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-AbsoluteLocationPath)/term) = 1">
            <term name="LocationPath">
              <tns:copy-of select="exsl:node-set($option-AbsoluteLocationPath)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-AbsoluteLocationPath)/remainder[1]"/>
            </remainder>
          </tns:when>
          <tns:otherwise/>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: AbsoluteLocationPath-->
  <tns:template name="p:AbsoluteLocationPath">
    <tns:param name="in"/>
    <!-- AbsoluteLocationPath -> slash RelativeLocationPath -->
    <tns:variable name="option-slash-RelativeLocationPath">
      <!-- part slash-->
      <tns:variable name="part1">
        <tns:call-template name="p:slash">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
      <!-- and part RelativeLocationPath-->
      <tns:variable name="part2">
        <tns:if test="exsl:node-set($part1)/remainder">
          <tns:call-template name="p:RelativeLocationPath">
            <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
          </tns:call-template>
        </tns:if>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part2)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-slash-RelativeLocationPath)/term) = 2">
        <term name="AbsoluteLocationPath">
          <tns:copy-of select="exsl:node-set($option-slash-RelativeLocationPath)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-slash-RelativeLocationPath)/remainder[2]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- AbsoluteLocationPath -> slashslash RelativeLocationPath -->
        <tns:variable name="option-slashslash-RelativeLocationPath">
          <!-- part slashslash-->
          <tns:variable name="part1">
            <tns:call-template name="p:slashslash">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
          <!-- and part RelativeLocationPath-->
          <tns:variable name="part2">
            <tns:if test="exsl:node-set($part1)/remainder">
              <tns:call-template name="p:RelativeLocationPath">
                <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
              </tns:call-template>
            </tns:if>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part2)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-slashslash-RelativeLocationPath)/term) = 2">
            <term name="AbsoluteLocationPath">
              <tns:copy-of select="exsl:node-set($option-slashslash-RelativeLocationPath)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-slashslash-RelativeLocationPath)/remainder[2]"/>
            </remainder>
          </tns:when>
          <tns:otherwise>
            <!-- AbsoluteLocationPath -> slash -->
            <tns:variable name="option-slash">
              <!-- part slash-->
              <tns:variable name="part1">
                <tns:call-template name="p:slash">
                  <tns:with-param name="in" select="$in"/>
                </tns:call-template>
              </tns:variable>
              <tns:copy-of select="exsl:node-set($part1)"/>
            </tns:variable>
            <tns:choose>
              <tns:when test="count(exsl:node-set($option-slash)/term) = 1">
                <term name="AbsoluteLocationPath">
                  <tns:copy-of select="exsl:node-set($option-slash)/term"/>
                </term>
                <remainder>
                  <tns:value-of select="exsl:node-set($option-slash)/remainder[1]"/>
                </remainder>
              </tns:when>
              <tns:otherwise/>
            </tns:choose>
          </tns:otherwise>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: RelativeLocationPath-->
  <tns:template name="p:RelativeLocationPath">
    <tns:param name="in"/>
    <!-- RelativeLocationPath -> Step RelativeLocationPath-rest -->
    <tns:variable name="option-Step-RelativeLocationPath-rest">
      <!-- part Step-->
      <tns:variable name="part1">
        <tns:call-template name="p:Step">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
      <!-- and part RelativeLocationPath-rest-->
      <tns:variable name="part2">
        <tns:if test="exsl:node-set($part1)/remainder">
          <tns:call-template name="p:RelativeLocationPath-rest">
            <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
          </tns:call-template>
        </tns:if>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part2)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-Step-RelativeLocationPath-rest)/term) = 2">
        <term name="RelativeLocationPath">
          <tns:copy-of select="exsl:node-set($option-Step-RelativeLocationPath-rest)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-Step-RelativeLocationPath-rest)/remainder[2]"/>
        </remainder>
      </tns:when>
      <tns:otherwise/>
    </tns:choose>
  </tns:template>
  <!-- Construct: RelativeLocationPath-rest-->
  <tns:template name="p:RelativeLocationPath-rest">
    <tns:param name="in"/>
    <!-- RelativeLocationPath-rest -> slash Step RelativeLocationPath-rest -->
    <tns:variable name="option-slash-Step-RelativeLocationPath-rest">
      <!-- part slash-->
      <tns:variable name="part1">
        <tns:call-template name="p:slash">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
      <!-- and part Step-->
      <tns:variable name="part2">
        <tns:if test="exsl:node-set($part1)/remainder">
          <tns:call-template name="p:Step">
            <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
          </tns:call-template>
        </tns:if>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part2)"/>
      <!-- and part RelativeLocationPath-rest-->
      <tns:variable name="part3">
        <tns:if test="exsl:node-set($part2)/remainder">
          <tns:call-template name="p:RelativeLocationPath-rest">
            <tns:with-param name="in" select="exsl:node-set($part2)/remainder"/>
          </tns:call-template>
        </tns:if>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part3)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-slash-Step-RelativeLocationPath-rest)/term) = 3">
        <term name="RelativeLocationPath-rest">
          <tns:copy-of select="exsl:node-set($option-slash-Step-RelativeLocationPath-rest)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-slash-Step-RelativeLocationPath-rest)/remainder[3]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- RelativeLocationPath-rest -> slashslash Step RelativeLocationPath-rest -->
        <tns:variable name="option-slashslash-Step-RelativeLocationPath-rest">
          <!-- part slashslash-->
          <tns:variable name="part1">
            <tns:call-template name="p:slashslash">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
          <!-- and part Step-->
          <tns:variable name="part2">
            <tns:if test="exsl:node-set($part1)/remainder">
              <tns:call-template name="p:Step">
                <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
              </tns:call-template>
            </tns:if>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part2)"/>
          <!-- and part RelativeLocationPath-rest-->
          <tns:variable name="part3">
            <tns:if test="exsl:node-set($part2)/remainder">
              <tns:call-template name="p:RelativeLocationPath-rest">
                <tns:with-param name="in" select="exsl:node-set($part2)/remainder"/>
              </tns:call-template>
            </tns:if>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part3)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-slashslash-Step-RelativeLocationPath-rest)/term) = 3">
            <term name="RelativeLocationPath-rest">
              <tns:copy-of select="exsl:node-set($option-slashslash-Step-RelativeLocationPath-rest)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-slashslash-Step-RelativeLocationPath-rest)/remainder[3]"/>
            </remainder>
          </tns:when>
          <tns:otherwise>
            <!-- RelativeLocationPath-rest -> -->
            <term name="RelativeLocationPath-rest"/>
            <remainder>
              <tns:value-of select="$in"/>
            </remainder>
          </tns:otherwise>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: Step-->
  <tns:template name="p:Step">
    <tns:param name="in"/>
    <!-- Step -> AxisSpecifier NodeTest -->
    <tns:variable name="option-AxisSpecifier-NodeTest">
      <!-- part AxisSpecifier-->
      <tns:variable name="part1">
        <tns:call-template name="p:AxisSpecifier">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
      <!-- and part NodeTest-->
      <tns:variable name="part2">
        <tns:if test="exsl:node-set($part1)/remainder">
          <tns:call-template name="p:NodeTest">
            <tns:with-param name="in" select="exsl:node-set($part1)/remainder"/>
          </tns:call-template>
        </tns:if>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part2)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-AxisSpecifier-NodeTest)/term) = 2">
        <term name="Step">
          <tns:copy-of select="exsl:node-set($option-AxisSpecifier-NodeTest)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-AxisSpecifier-NodeTest)/remainder[2]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- Step -> AbbreviatedStep -->
        <tns:variable name="option-AbbreviatedStep">
          <!-- part AbbreviatedStep-->
          <tns:variable name="part1">
            <tns:call-template name="p:AbbreviatedStep">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-AbbreviatedStep)/term) = 1">
            <term name="Step">
              <tns:copy-of select="exsl:node-set($option-AbbreviatedStep)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-AbbreviatedStep)/remainder[1]"/>
            </remainder>
          </tns:when>
          <tns:otherwise/>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: AxisSpecifier-->
  <tns:template name="p:AxisSpecifier">
    <tns:param name="in"/>
    <!-- AxisSpecifier -> axisName -->
    <tns:variable name="option-axisName">
      <!-- part axisName-->
      <tns:variable name="part1">
        <tns:call-template name="p:axisName">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-axisName)/term) = 1">
        <term name="AxisSpecifier">
          <tns:copy-of select="exsl:node-set($option-axisName)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-axisName)/remainder[1]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- AxisSpecifier -> at -->
        <tns:variable name="option-at">
          <!-- part at-->
          <tns:variable name="part1">
            <tns:call-template name="p:at">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-at)/term) = 1">
            <term name="AxisSpecifier">
              <tns:copy-of select="exsl:node-set($option-at)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-at)/remainder[1]"/>
            </remainder>
          </tns:when>
          <tns:otherwise>
            <!-- AxisSpecifier -> -->
            <term name="AxisSpecifier"/>
            <remainder>
              <tns:value-of select="$in"/>
            </remainder>
          </tns:otherwise>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: AbbreviatedStep-->
  <tns:template name="p:AbbreviatedStep">
    <tns:param name="in"/>
    <!-- AbbreviatedStep -> dot -->
    <tns:variable name="option-dot">
      <!-- part dot-->
      <tns:variable name="part1">
        <tns:call-template name="p:dot">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-dot)/term) = 1">
        <term name="AbbreviatedStep">
          <tns:copy-of select="exsl:node-set($option-dot)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-dot)/remainder[1]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- AbbreviatedStep -> dotdot -->
        <tns:variable name="option-dotdot">
          <!-- part dotdot-->
          <tns:variable name="part1">
            <tns:call-template name="p:dotdot">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-dotdot)/term) = 1">
            <term name="AbbreviatedStep">
              <tns:copy-of select="exsl:node-set($option-dotdot)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-dotdot)/remainder[1]"/>
            </remainder>
          </tns:when>
          <tns:otherwise/>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: NodeTest-->
  <tns:template name="p:NodeTest">
    <tns:param name="in"/>
    <!-- NodeTest -> NameTest -->
    <tns:variable name="option-NameTest">
      <!-- part NameTest-->
      <tns:variable name="part1">
        <tns:call-template name="p:NameTest">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-NameTest)/term) = 1">
        <term name="NodeTest">
          <tns:copy-of select="exsl:node-set($option-NameTest)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-NameTest)/remainder[1]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- NodeTest -> NodeType -->
        <tns:variable name="option-NodeType">
          <!-- part NodeType-->
          <tns:variable name="part1">
            <tns:call-template name="p:NodeType">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-NodeType)/term) = 1">
            <term name="NodeTest">
              <tns:copy-of select="exsl:node-set($option-NodeType)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-NodeType)/remainder[1]"/>
            </remainder>
          </tns:when>
          <tns:otherwise/>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: NodeType-->
  <tns:template name="p:NodeType">
    <tns:param name="in"/>
    <!-- NodeType -> node -->
    <tns:variable name="option-node">
      <!-- part node-->
      <tns:variable name="part1">
        <tns:call-template name="p:node">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-node)/term) = 1">
        <term name="NodeType">
          <tns:copy-of select="exsl:node-set($option-node)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-node)/remainder[1]"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <!-- NodeType -> text -->
        <tns:variable name="option-text">
          <!-- part text-->
          <tns:variable name="part1">
            <tns:call-template name="p:text">
              <tns:with-param name="in" select="$in"/>
            </tns:call-template>
          </tns:variable>
          <tns:copy-of select="exsl:node-set($part1)"/>
        </tns:variable>
        <tns:choose>
          <tns:when test="count(exsl:node-set($option-text)/term) = 1">
            <term name="NodeType">
              <tns:copy-of select="exsl:node-set($option-text)/term"/>
            </term>
            <remainder>
              <tns:value-of select="exsl:node-set($option-text)/remainder[1]"/>
            </remainder>
          </tns:when>
          <tns:otherwise>
            <!-- NodeType -> comment -->
            <tns:variable name="option-comment">
              <!-- part comment-->
              <tns:variable name="part1">
                <tns:call-template name="p:comment">
                  <tns:with-param name="in" select="$in"/>
                </tns:call-template>
              </tns:variable>
              <tns:copy-of select="exsl:node-set($part1)"/>
            </tns:variable>
            <tns:choose>
              <tns:when test="count(exsl:node-set($option-comment)/term) = 1">
                <term name="NodeType">
                  <tns:copy-of select="exsl:node-set($option-comment)/term"/>
                </term>
                <remainder>
                  <tns:value-of select="exsl:node-set($option-comment)/remainder[1]"/>
                </remainder>
              </tns:when>
              <tns:otherwise>
                <!-- NodeType -> processingInstruction -->
                <tns:variable name="option-processingInstruction">
                  <!-- part processingInstruction-->
                  <tns:variable name="part1">
                    <tns:call-template name="p:processingInstruction">
                      <tns:with-param name="in" select="$in"/>
                    </tns:call-template>
                  </tns:variable>
                  <tns:copy-of select="exsl:node-set($part1)"/>
                </tns:variable>
                <tns:choose>
                  <tns:when test="count(exsl:node-set($option-processingInstruction)/term) = 1">
                    <term name="NodeType">
                      <tns:copy-of select="exsl:node-set($option-processingInstruction)/term"/>
                    </term>
                    <remainder>
                      <tns:value-of select="exsl:node-set($option-processingInstruction)/remainder[1]"/>
                    </remainder>
                  </tns:when>
                  <tns:otherwise/>
                </tns:choose>
              </tns:otherwise>
            </tns:choose>
          </tns:otherwise>
        </tns:choose>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <!-- Construct: NameTest-->
  <tns:template name="p:NameTest">
    <tns:param name="in"/>
    <!-- NameTest -> ncname -->
    <tns:variable name="option-ncname">
      <!-- part ncname-->
      <tns:variable name="part1">
        <tns:call-template name="p:ncname">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:variable>
      <tns:copy-of select="exsl:node-set($part1)"/>
    </tns:variable>
    <tns:choose>
      <tns:when test="count(exsl:node-set($option-ncname)/term) = 1">
        <term name="NameTest">
          <tns:copy-of select="exsl:node-set($option-ncname)/term"/>
        </term>
        <remainder>
          <tns:value-of select="exsl:node-set($option-ncname)/remainder[1]"/>
        </remainder>
      </tns:when>
      <tns:otherwise/>
    </tns:choose>
  </tns:template>
  <!-- Templates from grammar -->
</tns:stylesheet>
