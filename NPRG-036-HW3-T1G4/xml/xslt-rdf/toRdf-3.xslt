<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="text" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/maps">
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