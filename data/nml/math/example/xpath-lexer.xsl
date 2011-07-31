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
      <tns:when test="starts-with($in, 'descendant-or-self::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 20)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 21)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'following-sibling::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 19)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 20)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'preceding-sibling::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 19)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 20)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'ancestor-or-self::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 18)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 19)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'descendant::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 12)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 13)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'attribute::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 11)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 12)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'following::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 11)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 12)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'namespace::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 11)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 12)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'preceding::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 11)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 12)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'ancestor::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 10)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 11)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'comment()')">
        <token type="comment">
          <tns:value-of select="substring($in, 1, 9)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 10)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'parent::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 8)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 9)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'child::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 7)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 8)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'self::')">
        <token type="axisName">
          <tns:value-of select="substring($in, 1, 6)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 7)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'text()')">
        <token type="text">
          <tns:value-of select="substring($in, 1, 6)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 7)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'node()')">
        <token type="node">
          <tns:value-of select="substring($in, 1, 6)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 7)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'and')">
        <token type="and">
          <tns:value-of select="substring($in, 1, 3)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 4)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'div')">
        <token type="div">
          <tns:value-of select="substring($in, 1, 3)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 4)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'mod')">
        <token type="mod">
          <tns:value-of select="substring($in, 1, 3)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 4)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '//')">
        <token type="slashslash">
          <tns:value-of select="substring($in, 1, 2)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 3)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '..')">
        <token type="dotdot">
          <tns:value-of select="substring($in, 1, 2)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 3)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'or')">
        <token type="or">
          <tns:value-of select="substring($in, 1, 2)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 3)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '!=')">
        <token type="equalityOperator">
          <tns:value-of select="substring($in, 1, 2)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 3)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '&lt;=')">
        <token type="relationalOperator">
          <tns:value-of select="substring($in, 1, 2)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 3)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '&gt;=')">
        <token type="relationalOperator">
          <tns:value-of select="substring($in, 1, 2)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 3)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '/')">
        <token type="slash">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '.')">
        <token type="dot">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '@')">
        <token type="at">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, ':')">
        <token type="colon">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '(')">
        <token type="lparen">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, ')')">
        <token type="rparen">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '[')">
        <token type="lbrack">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, ']')">
        <token type="rbrack">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '*')">
        <token type="asterisk">
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
      <tns:when test="starts-with($in, '+')">
        <token type="plus">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '=')">
        <token type="equalityOperator">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '&lt;')">
        <token type="relationalOperator">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '&gt;')">
        <token type="relationalOperator">
          <tns:value-of select="substring($in, 1, 1)"/>
        </token>
        <remainder>
          <tns:value-of select="substring($in, 2)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, 'processing-instruction(')">
        <tns:variable name="after" select="substring($in, 24)"/>
        <token type="processingInstruction">
          <tns:value-of select="substring-before($after, ')')"/>
        </token>
        <remainder>
          <tns:value-of select="substring-after($after, ')')"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, &quot;'&quot;)">
        <token type="literal">
          <tns:value-of select="substring-before(substring($in, 2), &quot;'&quot;)"/>
        </token>
        <remainder>
          <tns:value-of select="substring-after(substring($in, 2), &quot;'&quot;)"/>
        </remainder>
      </tns:when>
      <tns:when test="starts-with($in, '&quot;')">
        <tns:variable name="after" select="substring($in, 2)"/>
        <token type="literal">
          <tns:value-of select="substring-before($after, '&quot;')"/>
        </token>
        <remainder>
          <tns:value-of select="substring-after($after, '&quot;')"/>
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
    <pattern name="ncname">
      <match>
        <tns:text>1234567890_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ#-</tns:text>
      </match>
      <inverse>
        <tns:text> 
      
      
    
      
      
    
      
      
    ///...@:()[]*+=!=&lt;&lt;=&gt;&gt;=::::::::::::::::::::::::::()()()</tns:text>
      </inverse>
      <stopper>
        <tns:text>                                                                                                                 </tns:text>
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
