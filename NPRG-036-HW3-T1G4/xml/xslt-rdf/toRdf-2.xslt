<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="text" indent="yes" encoding="UTF-8"/>

  <!-- Nejsem si jistý zadáním; druhý a třetí soubor
       píšu tak, že výsledné rdf nejsou korektní, a jsou
       určeny k tomu aby byly připojeny k prvnímu.
       Pokud to tak nemá být, tak stačí první xsl:text z prvního
       xslt zařadit na začátky prvních templatů druhého a třetího
       souboru.
       S přáním pěkného dne,
       Matěj Heczko -->

  <xsl:template match="/items">
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