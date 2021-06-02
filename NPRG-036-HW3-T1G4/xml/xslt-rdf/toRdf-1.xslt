<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="text" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/users"> <!-- Dictionary -->
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

      csgo:Skin
        a owl:Class ;
        rdfs:subClassOf vgo:GameProduct ;
        rdfs:comment "An in-game object that modifies the visual style of an Item."@en .

      csgo:skinFor
        a rdf:Property ;
        rdfs:domain csgo:Skin ;
        rdfs:range vgo:Item ;
        rdfs:comment "The item for which the skin is equippable."@en .

      csgo:condition
        a rdf:Property ;
        rdfs:domain csgo:Skin ;
        rdfs:range xsd:float ; # represented as a number between 0 and 1
        rdfs:comment "Each skin has an assigned condition to it, e.g. Well-Worn."@en .

      csgo:cost
        a rdf:Property ;
        rdfs:domain vgo:Item ;
        rdfs:range xsd:integer ;
        rdfs:comment "Most items have an assigned cost when being purchased at the start of a round"@en .

      csgo:Knife
        a owl:Class ;
        rdfs:subClassOf vgo:Item ;
        rdfs:comment "A weapon to be used in a melee range."@en .

      csgo:Utility
        a owl:Class ;
        rdfs:subClassOf vgo:Item ;
        rdfs:comment "A set of items whose purpose is utility during a match, such a defusal kit."@en .

      csgo:utilityType
        a rdf:Property ;
        rdfs:domain csgo:Utility ;
        rdfs:range rdfs:Resource ;
        rdfs:comment "The type of the utility, ranging from passive bonuses (rescue kit, defuse kit) to deployable bonuses (ammunition pile, grenade box)."@en .

      csgo:Throwable
        a owl:Class ;
        rdfs:subClassOf csgo:Utility ;
        rdfs:comment "Throwable items, such as grenades or decoys."@en .

      csgo:throwableCount
        a rdf:Property ;
        rdfs:domain csgo:Throwable ;
        rdfs:range xsd:integer ;
        rdfs:comment "The maximum number of the throwable equippable at the same time."@en .

      csgo:aoe
        a rdf:Property ;
        rdfs:domain vgo:Item ;
        rdfs:range xsd:integer ;
        rdfs:comment "The area of effect of a throwable."@en .

      csgo:Bomb
        a owl:Class ;
        rdfs:subClassOf vgo:Item ;
        rdfs:comment "The bomb used to win the game."@en .

      csgo:Firearm
        a owl:Class ;
        rdfs:subClassOf vgo:Item ;
        rdfs:comment "A bullet-firing weapon" .

      csgo:firerate
        a rdf:Property ;
        rdfs:domain csgo:Firearm ;
        rdfs:range xsd:integer ;
        rdfs:comment "The rounds per minute fired by the firearm."@en .

      csgo:isPrimary
        a rdf:Property ;
        rdfs:domain csgo:Firearm ;
        rdfs:range schema:Boolean ;
        rdfs:comment "Decides whether the firearm is in the primary or secondary slot."@en .

      csgo:Armor
        a owl:Class ;
        rdfs:subClassOf vgo:Item ;
        rdfs:comment "Purchasable item that reduces damage taken."@en .

      csgo:durability
        a rdf:Property ;
        rdfs:domain csgo:Armor ;
        rdfs:range xsd:integer ;
        rdfs:comment "The base amount of extra health the armour type provides."@en .

      csgo:Team
        a owl:Class ;
        rdfs:domain vgo:Session ;
        rdfs:range vgo:Character ;
        rdfs:comment "A group of characters playing a game session. " .

      csgo:damage
        a rdfs:Property ;
        rdfs:domain vgo:Item ;
        rdfs:range xsd:integer ;
        rdfs:comment "How much health an item takes from a game object (e.g. player) when successfully applied"@en .

      csgo:mapName
        a rdfs:Property ;
        rdfs:domain vgo:PlayingArea ;
        rdfs:subClassOf rdfs:label ;
        rdfs:comment "The name of a map as shown in the matchmaking map selection menu, such as Dust."@en .

      csgo:mapId
        a rdfs:Property ;
        rdfs:domain vgo:PlayingArea ;
        rdfs:range rdfs:Literal ;
        rdfs:subClassOf rdfs:label ;
        rdfs:comment "The identification of a map within gamefiles, such as de_dust."@en .

      csgo:spawnLocation
        a rdfs:Property ;
        rdfs:domain vgo:PlayingArea ;
        rdfs:subClassOf schema:GeoShape ;
        rdfs:comment "The locations where the players appear at the start of a round."@en .
        
      csgo:plantArea
        a rdf:Property ;
        rdfs:domain vgo:PlayingArea ;
        rdfs:range schema:GeoShape ;
        rdfs:comment "The zone in which the bomb can be planted."@en .

      csgo:isBot
        a rdfs:Property ;
        rdfs:domain vgo:Character ;
        rdfs:subClassOf schema:Boolean ;
        rdfs:comment "Integer saying whether a character is computer-controlled."@en .

      csgo:hadKD
        a rdfs:Property ;
        rdfs:domain vgo:Character ;
        rdfs:range xsd:float ;
        rdfs:comment "The KD ratio the player had at the end of the match."@en .

      csgo:playedOn
        a rdfs:Property ;
        rdfs:domain vgo:Session ;
        rdfs:range vgo:PlayingArea ;
        rdfs:comment "Says which map a match is being played on."@en .

      csgo:includesCharacters
        a rdfs:Property ;
        rdfs:domain vgo:Session ;
        rdfs:range vgo:Character ;
        rdfs:comment "Lists the characters that are bound to the current sessions."@en .

      csgo:isOnTeam
        a rdfs:Property ;
        rdfs:domain vgo:Character ;
        rdfs:range csgo:Team ;
        rdfs:comment "Says which team the character is on."@en .

      csgo:hasTeams
        a rdfs:Property ;
        rdfs:domain vgo:Session ;
        rdfs:range csgo:Team ;
        rdfs:comment "Provides information about the two teams in a given session."@en .

      @prefix csgousers: &lt;http://example.org/profile/&gt; .
      @prefix csgodb: &lt;http://example.org/info/&gt; .
    </xsl:text>
    <xsl:apply-templates select="user"/>
    <xsl:apply-templates select="user/matches/match" />
    <xsl:apply-templates select="user/players/player" />
    <xsl:apply-templates select="user/skins/skin" />
    <xsl:apply-templates select="user/players/player/team" />
  </xsl:template>
  
  <xsl:template match="user">
    <xsl:text>csgousers:</xsl:text><xsl:value-of select="@userid"/><xsl:text>
      a vgo:Player;
      foaf:accountName "</xsl:text>
    <xsl:value-of select="@userid"/><xsl:text>";&#xa;</xsl:text>
    <xsl:apply-templates select="usernames/username"/>
    <xsl:text>vcard:hasEmail "mailto:</xsl:text>
    <xsl:value-of select="emailaddress"/>
    <xsl:text>";&#xa;</xsl:text>
    <xsl:for-each select="matches/match">
      <xsl:text>  vgo:isPlayerInSession csgodb:match-</xsl:text>
      <xsl:value-of select="@matchid"/>
      <xsl:text>;&#xa;</xsl:text>
    </xsl:for-each>
    <xsl:for-each select="players/player">
      <xsl:text>  vgo:ownsCharacter csgodb:player-</xsl:text>
      <xsl:value-of select="@characterid"/>
      <xsl:text>;&#xa;</xsl:text>
    </xsl:for-each>
    <xsl:for-each select="skins/skin">
      <xsl:text>  vgo:ownsItem csgodb:skin-</xsl:text>
      <xsl:value-of select="@skinid"/>
      <xsl:text>;&#xa;</xsl:text>
    </xsl:for-each>
    <xsl:text>  dcterms:created "</xsl:text>
    <xsl:value-of select="creationdate"/>
    <xsl:text>"^^xsd:date.&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="usernames/username">
    <xsl:text>  vcard:nickname "</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>";&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="user/matches/match">
    <xsl:text>csgodb:match-</xsl:text>
    <xsl:value-of select="@matchid"/>
    <xsl:text>
      a vgo:Session;
      rdfs:label "Match #</xsl:text>
    <xsl:value-of select="@matchid"/>
    <xsl:text>"@en;
      vgo:startTime "</xsl:text>
    <xsl:value-of select="@date"/>
    <xsl:text>".&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="user/players/player">
    <xsl:text>csgodb:player-</xsl:text>
    <xsl:value-of select="@characterid"/>
    <xsl:text>
      a vgo:Character;
      vcard:nickname "</xsl:text>
    <xsl:value-of select="username"/>
    <xsl:text>";
      csgo:isBot "</xsl:text>
    <xsl:value-of select="isbot"/>
    <xsl:text>";
      csgo:hadKD "</xsl:text>
    <xsl:value-of select="kd"/>
    <xsl:text>"^^xsd:float;
      csgo:inOnTeam csgodb:team-</xsl:text>
    <xsl:value-of select="team/@teamid"/>
    <xsl:text> .&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="user/skins/skin">
    <xsl:text>csgodb:skin-</xsl:text>
    <xsl:value-of select="@skinid"/>
    <xsl:text>
      a csgo:Skin;
      csgo:condition "</xsl:text>
    <xsl:value-of select="condition"/>
    <xsl:text>"^^xsd:float;
      rdfs:label "</xsl:text>
    <xsl:value-of select="skinname"/>
    <xsl:text>"@en.&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="user/players/player/team">
    <xsl:text>csgodb:team-</xsl:text>
    <xsl:value-of select="@teamid"/>
    <xsl:text> a csgo:Team;
      rdfs:label "Team starting as </xsl:text>
    <xsl:value-of select="teamname"/>
    <xsl:text>."@en.&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>