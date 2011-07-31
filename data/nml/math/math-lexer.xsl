<?xml version="1.0" encoding="UTF-8"?>
<tns:stylesheet xmlns:tns="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.pingdynasty.com/namespaces/tokenizer" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:ignore="ignore" t:ignore="ignore" exclude-result-prefixes="exsl">
  <tns:output method="xml" indent="yes" encoding="UTF-8"/>
  <tns:template name="t:nextToken">
    <tns:param name="in"/>
    <tns:choose>
      <tns:when test="string-length($in) = 0">
        <token type="end"/>
      </tns:when>
      <tns:when test="starts-with($in, ' ')">
        <tns:call-template name="t:nextToken">
          <tns:with-param name="in" select="substring($in, 2)"/>
        </tns:call-template>
      </tns:when>
      <tns:when test="starts-with($in, '+')">
        <token type="plus">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '-')">
        <token type="minus">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '*')">
        <token type="times">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '/')">
        <token type="div">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '(')">
        <token type="lbrace">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, ')')">
        <token type="rbrace">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:otherwise>
        <tns:call-template name="t:token">
          <tns:with-param name="in" select="$in"/>
        </tns:call-template>
      </tns:otherwise>
    </tns:choose>
  </tns:template>
  <tns:variable name="t:patterns">
    <pattern name="number">
      <match>
        <tns:text>.0123456789</tns:text>
      </match>
      <inverse>
        <tns:text> +-*/()</tns:text>
      </inverse>
      <stopper>
        <tns:text>       </tns:text>
      </stopper>
    </pattern>
  </tns:variable>
  <tns:template name="t:token">
    <tns:param name="in"/>
    <!-- create the longest possible token from a set of accepted characters -->
    <tns:variable name="matches">
      <tns:for-each select="exsl:node-set($t:patterns)/pattern">
        <tns:sort select="string-length(substring-before(concat(translate($in, inverse/text(), stopper/text()), ' '), ' '))" data-type="number" order="descending"/>
        <pattern>
          <name>
            <tns:value-of select="@name"/>
          </name>
          <match>
            <tns:value-of select="substring-before(concat(translate($in, inverse/text(), stopper/text()), ' '), ' ')"/>
          </match>
        </pattern>
      </tns:for-each>
    </tns:variable>
    <tns:variable name="token" select="exsl:node-set($matches)/pattern[1]/match"/>
    <tns:variable name="name" select="exsl:node-set($matches)/pattern[1]/name"/>
    <tns:if test="$token">
      <token type="{$name}">
        <tns:value-of select="$token"/>
      </token>
      <remainder>
        <tns:value-of select="substring-after($in, $token)"/>
      </remainder>
    </tns:if>
  </tns:template>
  <tns:template name="t:tokenize">
    <tns:param name="in"/>
    <tns:variable name="token">
      <tns:call-template name="t:nextToken">
        <tns:with-param name="in" select="$in"/>
      </tns:call-template>
    </tns:variable>
    <tns:copy-of select="exsl:node-set($token)/token"/>
    <tns:if test="exsl:node-set($token)/token/@type != 'end'">
      <tns:call-template name="t:tokenize">
        <tns:with-param name="in" select="exsl:node-set($token)/remainder"/>
      </tns:call-template>
    </tns:if>
  </tns:template>
</tns:stylesheet>
