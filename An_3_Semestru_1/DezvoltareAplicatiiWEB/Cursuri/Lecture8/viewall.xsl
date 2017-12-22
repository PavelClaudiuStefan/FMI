<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
    <head>
      <title>Automatically Generated Romanian Synsets</title>
    </head>
      <xsl:apply-templates/>
    </html>
  </xsl:template>
  <xsl:template match="FSynsetsDoc">
    <body bgcolor="white">
    <p align="center"><b><u>Automatically Generated Romanian Synsets</u></b></p>
    <p align="center"><b><font size="2"><xsl:value-of select="@pos"/>s</font></b></p>
    <xsl:apply-templates select="synset"/> 
    </body>
  </xsl:template>
  <xsl:template match="synset">
    <hr/>
    <b><font size="2">English synset:</font></b><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
    <font size="2">{<xsl:apply-templates select="synset_en/word"/>}</font>
    <blockquote><p align="justify"><b><font size="2"><xsl:value-of select="synset_en/gloss"/></font></b></p></blockquote>
    <xsl:apply-templates select="e-sets"/>
    <xsl:apply-templates select="fsynsets"/>
    <hr/>
  </xsl:template>
  <xsl:template match="e-sets">
    <b><font size="2">e-sets:</font></b>
    <center>
    <table border="3">
    <tr>
    <td align="center"><b><font size="2">eword</font></b></td>
    <td align="center" bgcolor="lightgrey"><b><font size="2">e-set</font></b></td>
    <td align="center"><b><font size="2">score</font></b></td>
    </tr>
    <xsl:apply-templates select="e-set"/>
    </table>
    </center>
  </xsl:template>
  <xsl:template match="fsynsets">
    <b><font size="2">proposed foreign synset(s):</font></b>
    <ul>
    <xsl:choose>
      <xsl:when test="child::fsynset"><xsl:apply-templates select="fsynset"/></xsl:when>
      <xsl:otherwise><li/><font size="2">None (only unlabeled e-sets have been generated)</font></xsl:otherwise>
    </xsl:choose>
    </ul>
  </xsl:template>
  <xsl:template match="e-set">
    <tr>
    <td align="center"><font size="2"><xsl:value-of select="eword"/></font></td>
    <td align="center" bgcolor="lightgrey"><font size="2">{<xsl:apply-templates select="word"/>}</font></td>
    <td align="center"><font size="2"><xsl:value-of select="@score"/></font></td>
    </tr>
  </xsl:template>
  <xsl:template match="fsynset">
    <li/><font size="2">{<xsl:apply-templates select="word"/>}</font>
  </xsl:template>
  <xsl:template match="word">
    <xsl:value-of select="."/>
    <xsl:if test="position() != last()">, </xsl:if>
  </xsl:template>
</xsl:stylesheet>


