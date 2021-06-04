<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="text" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/items">
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
    <xsl:apply-templates select="//skins/skin"/>
    <xsl:apply-templates select="knife"/>
    <xsl:apply-templates select="firearm"/>
    <xsl:apply-templates select="utility"/>
    <xsl:apply-templates select="armor"/>
    <xsl:apply-templates select="throwable"/>
    <xsl:apply-templates select="bomb"/>
  </xsl:template>
  
  <xsl:template match="//skins/skin">
    <xsl:text>csgodb:skin-</xsl:text>
    <xsl:value-of select="@skinid"/>
    <xsl:text> csgo:skinFor csgodb:item-</xsl:text>
    <xsl:if test="../../@utilityid">
      <xsl:value-of select="../../@utilityid"/>
    </xsl:if>
    <xsl:if test="../../@weaponid">
      <xsl:value-of select="../../@weaponid"/>
    </xsl:if>
    <xsl:if test="../../@armorid">
      <xsl:value-of select="../../@armorid"/>
    </xsl:if>
    <xsl:text>.&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="knife">
    <xsl:text>csgodb:item-</xsl:text>
    <xsl:value-of select="@weaponid"/><xsl:text>
      a csgo:Knife;
      csgo:cost "</xsl:text>
    <xsl:value-of select="cost"/>
    <xsl:text>"^^xsd:integer ;
      rdfs:label "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>"@en ;
      csgo:damage "</xsl:text>
    <xsl:value-of select="damage"/>
    <xsl:text>"^^xsd:integer.&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="firearm">
    <xsl:text>csgodb:item-</xsl:text>
    <xsl:value-of select="@weaponid"/><xsl:text>
      a csgo:Firearm;
      csgo:cost "</xsl:text>
    <xsl:value-of select="cost"/>
    <xsl:text>"^^xsd:integer ;
      rdfs:label "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>"@en ;
      csgo:damage "</xsl:text>
    <xsl:value-of select="damage"/>
    <xsl:text>"^^xsd:integer;
      csgo:firerate "</xsl:text>
    <xsl:value-of select="firerate"/>
    <xsl:text>"^^xsd:integer;
      csgo:isPrimary "</xsl:text>
    <xsl:value-of select="@primary"/>
    <xsl:text>".&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="utility">
    <xsl:text>csgodb:item-</xsl:text>
    <xsl:value-of select="@utilityid"/><xsl:text>
      a csgo:Utility;
      csgo:cost "</xsl:text>
    <xsl:value-of select="cost"/>
    <xsl:text>"^^xsd:integer ;
      rdfs:label "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>"@en ;
      csgo:utilityType "</xsl:text>
    <xsl:value-of select="utilitytype"/>
    <xsl:text>".&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="armor">
    <xsl:text>csgodb:item-</xsl:text>
    <xsl:value-of select="@armorid"/><xsl:text>
      a csgo:Armor;
      csgo:cost "</xsl:text>
    <xsl:value-of select="cost"/>
    <xsl:text>"^^xsd:integer ;
      rdfs:label "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>"@en ;
      csgo:durability "</xsl:text>
    <xsl:value-of select="durability"/>
    <xsl:text>"^^xsd:integer.&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="throwable">
    <xsl:text>csgodb:item-</xsl:text>
    <xsl:value-of select="@utilityid"/><xsl:text>
      a csgo:Throwable;
      csgo:cost "</xsl:text>
    <xsl:value-of select="cost"/>
    <xsl:text>"^^xsd:integer ;
      rdfs:label "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>"@en ;
      csgo:damage "</xsl:text>
    <xsl:value-of select="damage"/>
    <xsl:text>"^^xsd:integer;
      csgo:aoe "</xsl:text>
    <xsl:value-of select="aoe"/>
    <xsl:text>"^^xsd:integer;
      csgo:throwableCount "</xsl:text>
    <xsl:value-of select="throwablecount"/>
    <xsl:text>"^^xsd:integer.&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="bomb">
    <xsl:text>csgodb:item-</xsl:text>
    <xsl:value-of select="@weaponid"/><xsl:text>
      a csgo:Bomb;
      csgo:cost "</xsl:text>
    <xsl:value-of select="cost"/>
    <xsl:text>"^^xsd:integer ;
      rdfs:label "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>"@en ;
      csgo:damage "</xsl:text>
    <xsl:value-of select="damage"/>
    <xsl:text>"^^xsd:integer;
      csgo:aoe "</xsl:text>
    <xsl:value-of select="aoe"/>
    <xsl:text>"^^xsd:integer.&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>