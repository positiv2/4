<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="text" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/maps">
    <xsl:text disable-output-escaping="yes">
      @prefix csgo: &lt;http://example.org/vocabulary/&gt; .
      @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
      @prefix vcard: &lt;http://www.w3.org/2006/vcard/ns#&gt; .
      @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
      @prefix vgo: &lt;http://vocab.linkeddata.es/vgo/&gt; .
      @prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
      @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
      @prefix owl: &lt;http://www.w3.org/2002/07/owl#&gt; .
      @prefix schema: &lt;http://schema.org/#&gt; .
      @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
      @prefix csgousers: &lt;http://example.org/profile/&gt; .
      @prefix csgodb: &lt;http://example.org/info/&gt; .&#xa;
    </xsl:text>
    <xsl:apply-templates select="map"/>
  </xsl:template>
  
  <xsl:template match="map">
    <xsl:text>csgodb:map-</xsl:text>
    <xsl:value-of select="@mapid"/>
    <xsl:text> a vgo:PlayingArea;&#xa;</xsl:text>
    <xsl:apply-templates select="spawnlocation"/>
    <xsl:apply-templates select="plantlocation"/>
    <xsl:text>  csgo:mapName "</xsl:text>
    <xsl:value-of select="mapname"/>
    <xsl:text>";
      csgo:mapId "</xsl:text>
    <xsl:value-of select="@mapid"/>
    <xsl:text>".&#xa;</xsl:text>
    <xsl:if test="matches/match">
      <xsl:apply-templates select="matches/match"/>
      <xsl:value-of select="@mapid"/>
      <xsl:text>.&#xa;</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="spawnlocation">
    <xsl:text>  csgo:spawnLocation "</xsl:text>
    <xsl:value-of select="x/x1"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="y/y1"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="z/z1"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="x/x2"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="y/y2"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="z/z2"/>
    <xsl:text>";&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="plantlocation">
    <xsl:text>  csgo:plantArea "</xsl:text>
    <xsl:value-of select="x/x1"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="y/y1"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="z/z1"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="x/x2"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="y/y2"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="z/z2"/>
    <xsl:text>";&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="matches/match">
    <xsl:text>csgodb:match-</xsl:text>
    <xsl:value-of select="@matchid"/>
    <xsl:text> csgo:playedOn csgodb:map-</xsl:text>
  </xsl:template>
</xsl:stylesheet>