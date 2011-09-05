<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:func="http://exslt.org/functions"
  xmlns:nml="http://bitwi.se/schemas/nml"
  extension-element-prefixes="func"
  exclude-result-prefixes="nml">
  <xsl:output method="html"/>

  <xsl:param name="stylesheet" select="'style.css'"/>

  <xsl:template match="@*"/>

  <xsl:template match="@xml:id|@xml:lang|@class">
    <xsl:attribute name="{local-name()}">
      <xsl:apply-templates/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="copy">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template name="copy.common-attributes">
    <xsl:apply-templates select="@xml:id|@xml:lang|@class"/>
  </xsl:template>

  <func:function name="nml:push-nmtoken">
    <xsl:param name="value"/>
    <xsl:param name="rest"/>

    <xsl:choose>
      <xsl:when test="$rest">
        <func:result select="concat($rest, ' ', $value)"/>
      </xsl:when>

      <xsl:otherwise>
        <func:result select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
  </func:function>

  <func:function name="nml:adjust-uri">
    <xsl:param name="uri" select="@uri"/>

    <func:result select="$uri"/>
  </func:function>

  <func:function name="nml:title-id">
    <xsl:param name="node" select="."/>

    <xsl:choose>
      <xsl:when test="$node/@xml:id">
        <func:result select="$node/@xml:id"/>
      </xsl:when>

      <xsl:otherwise>
        <func:result>
          <xsl:for-each select="$node/../ancestor::section/title">
            <xsl:value-of select="nml:title-name()"/>
            <xsl:text>-</xsl:text>
          </xsl:for-each>
          <xsl:value-of select="nml:title-name($node)"/>
        </func:result>
      </xsl:otherwise>
    </xsl:choose>
  </func:function>

  <func:function name="nml:title-name">
    <xsl:param name="title" select="."/>

    <func:result select="nml:downcase-ascii(nml:remove-non-ascii-alpha-numerics(translate(normalize-space($title), ' ', '-')))"/>
  </func:function>

  <func:function name="nml:remove-non-ascii-alpha-numerics">
    <xsl:param name="string"/>

    <func:result select="translate($string,
                                   translate($string,
                                             'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-',
                                             ''),
                                   '')"/>
  </func:function>

  <func:function name="nml:downcase-ascii">
    <xsl:param name="string"/>

    <func:result select="translate($string,
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz')"/>
  </func:function>

  <xsl:template match="nml">
    <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>&#x0a;</xsl:text>
    <html>
      <xsl:attribute name="lang">
        <xsl:choose>
          <xsl:when test="@xml:lang">
            <xsl:value-of select="@xml:lang"/>
          </xsl:when>

          <xsl:otherwise>
            <xsl:text>en</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:call-template name="nml.head"/>
      <xsl:call-template name="nml.body"/>
    </html>
  </xsl:template>

  <xsl:template name="nml.head">
    <head>
      <meta charset="utf-8"/>
      <link rel="stylesheet" href="{$stylesheet}"/>
      <title>
        <xsl:value-of select="title"/>
      </title>
    </head>
  </xsl:template>

  <xsl:template name="nml.body">
    <body>
      <xsl:call-template name="nml.body.header"/>
      <xsl:call-template name="nml.body.article"/>
      <xsl:call-template name="nml.body.footer"/>
    </body>
  </xsl:template>

  <xsl:template name="nml.body.header"/>

  <xsl:template name="nml.body.article">
    <article>
      <xsl:apply-templates/>
    </article>
  </xsl:template>

  <xsl:template name="nml.body.footer"/>

  <xsl:template match="title">
    <h1 id="{nml:title-id()}">
      <xsl:apply-templates select="@*|node()"/>
    </h1>
  </xsl:template>

  <xsl:template match="section |
                       p |
                       table |
                       span">
    <xsl:call-template name="copy"/>
  </xsl:template>

  <xsl:template match="item/code |
                       nml/code |
                       section/code">
    <pre>
      <xsl:call-template name="copy.code.attributes"/>
      <code>
        <xsl:apply-templates select="node()"/>
      </code>
    </pre>
  </xsl:template>

  <xsl:template name="copy.code.attributes">
    <xsl:call-template name="copy.common-attributes"/>
    <xsl:if test="@language">
      <xsl:attribute name="class">
        <xsl:value-of select="nml:push-nmtoken(concat('language-', @language), @class)"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template match="definitions">
    <dl>
      <xsl:apply-templates select="@*|node()"/>
    </dl>
  </xsl:template>

  <xsl:template match="definitions/item">
    <xsl:apply-templates select="node()"/>
  </xsl:template>

  <xsl:template match="term">
    <dt>
      <xsl:apply-templates select="@*|node()"/>
    </dt>
  </xsl:template>

  <xsl:template match="definition">
    <dd>
      <xsl:apply-templates select="@*|node()"/>
    </dd>
  </xsl:template>

  <xsl:template match="enumeration">
    <ol>
      <xsl:apply-templates select="@*|node()"/>
    </ol>
  </xsl:template>

  <xsl:template match="item">
    <li>
      <xsl:apply-templates select="@*|node()"/>
    </li>
  </xsl:template>

  <xsl:template match="figure">
    <p>
      <xsl:apply-templates select="@xml:id|@xml:lang"/>
      <xsl:variable name="class">
        <xsl:text>figure</xsl:text>
        <xsl:if test="@float">
          <xsl:text> figure.float.</xsl:text>
          <xsl:value-of select="@float"/>
        </xsl:if>
      </xsl:variable>
      <xsl:attribute name="class">
        <xsl:value-of select="nml:push-nmtoken($class, @class)"/>
      </xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </p>
  </xsl:template>

  <xsl:template match="itemization">
    <ul>
      <xsl:apply-templates select="@*|node()"/>
    </ul>
  </xsl:template>

  <xsl:template match="item/quote |
                       nml/quote |
                       section/quote">
    <blockquote>
      <xsl:apply-templates select="@*|node()"/>
    </blockquote>
  </xsl:template>

  <xsl:template match="line">
    <xsl:apply-templates select="@*|node()"/><br/>
  </xsl:template>

  <xsl:template match="attribution">
    <div class="attribution">
      <xsl:apply-templates select="@*"/>
      <span class="attribution-dash">—</span>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="head">
    <thead>
      <xsl:apply-templates select="@*|node()"/>
    </thead>
  </xsl:template>

  <xsl:template match="row">
    <tr>
      <xsl:apply-templates select="@*|node()"/>
    </tr>
  </xsl:template>

  <xsl:template match="head/row/cell">
    <th>
      <xsl:apply-templates select="@*|node()"/>
    </th>
  </xsl:template>

  <xsl:template match="body">
    <tbody>
      <xsl:apply-templates select="@*|node()"/>
    </tbody>
  </xsl:template>

  <xsl:template match="cell">
    <td>
      <xsl:apply-templates select="@*|node()"/>
    </td>
  </xsl:template>

  <xsl:template match="abbreviation">
    <abbr>
      <xsl:call-template name="copy.common-attributes"/>
      <xsl:attribute name="title">
        <xsl:value-of select="@for"/>
      </xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </abbr>
  </xsl:template>

  <xsl:template match="code">
    <code>
      <xsl:call-template name="copy.common-attributes"/>
      <xsl:call-template name="copy.code.attributes"/>
      <xsl:apply-templates select="node()"/>
    </code>
  </xsl:template>

  <xsl:template match="define">
    <xsl:choose>
      <xsl:when test="@uri">
        <!-- TODO: The title attribute should be placed here and not on the
             dfn.  Or perhaps add a standard title? -->
        <a href="{nml:adjust-uri()}">
          <xsl:call-template name="define"/>
        </a>
      </xsl:when>

      <xsl:otherwise>
        <xsl:call-template name="define"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="define">
    <dfn>
      <xsl:apply-templates select="@*|node()"/>
    </dfn>
  </xsl:template>

  <xsl:template match="emphasis">
    <em>
      <xsl:apply-templates select="@*|node()"/>
    </em>
  </xsl:template>

  <xsl:template match="image">
    <img src="{nml:adjust-uri()}">
      <xsl:call-template name="copy.common-attributes"/>
    </img>
  </xsl:template>

  <xsl:template match="ref">
    <a href="{nml:adjust-uri()}">
      <xsl:call-template name="copy.common-attributes"/>
      <xsl:copy-of select="@title"/>
      <xsl:if test="@relation">
        <xsl:attribute name="rel">
          <xsl:value-of select="@relation"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="node()"/>
    </a>
  </xsl:template>

  <xsl:template match="quote">
    <q cite="@source">
      <xsl:call-template name="copy.common-attributes"/>
      <xsl:apply-templates select="node()"/>
    </q>
  </xsl:template>
</xsl:stylesheet>
