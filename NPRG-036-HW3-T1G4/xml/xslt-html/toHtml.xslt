<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/users">
    <html>
      <head>
        <title>XSLT XML→HTML</title>
        <style>
          td, th {
            border: 1px solid #ddd;
          }
        </style>
      </head>
      <body>
        <h1>Users</h1>
        <table>
          <tr>
            <th>Current Username</th>
            <th>Username history</th>
            <th>Email address</th>
            <th>Account creation date</th>
            <th>Played as</th>
            <th>Played in</th>
            <th>Owns skins</th>
          </tr>
          <xsl:apply-templates select="user">
            <xsl:sort select="@userid" />
          </xsl:apply-templates>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="user">
      <tr>
        <td>
          <xsl:value-of select="(usernames/username)[1]"/>
        </td>
        <td>
          <ul>
            <xsl:apply-templates select="usernames/username" />
          </ul>
        </td>
        <td>
          <xsl:value-of select="emailaddress"/>
        </td>
        <td>
          <xsl:value-of select="creationdate"/>
        </td>
        <td>
          <ul>
            <xsl:apply-templates select="players/player" />
          </ul>
        </td>
        <td>
          <ul>
            <xsl:apply-templates select="matches/match" />
          </ul>
        </td>
        <td>
          <table>
            <tr>
              <th>Skin name</th>
              <th>Condition</th>
            </tr>
            <xsl:apply-templates select="skins/skin" />
          </table>
        </td>
      </tr>
  </xsl:template>
  
  <xsl:template match="usernames/username">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>
  
  <xsl:template match="players/player">
    <li>
      <xsl:text>Played with the nickname </xsl:text>
      <xsl:value-of select="username"/>
      <xsl:text> with the team color </xsl:text>
      <xsl:value-of select="color"/>
      <xsl:text> starting as </xsl:text>
      <xsl:value-of select="team/teamname" />
      <xsl:if test="isbot='true'">
        <xsl:text> and was replaced by a bot after reaching KD of </xsl:text>
      </xsl:if>
      <xsl:if test="isbot='false'">
        <xsl:text> and played for the whole duration of the match after reaching KD of </xsl:text>      
      </xsl:if>
      <xsl:value-of select="kd"/>
      <xsl:text>.</xsl:text>
    </li>
  </xsl:template>
  
  <xsl:template match="matches/match">
    <li>
      <xsl:text>Match #</xsl:text>
      <xsl:value-of select="@matchid"/>
      <xsl:text> on </xsl:text>
      <xsl:value-of select="@date"/>
    </li>
  </xsl:template>
  
  <xsl:template match="skins/skin">
    <tr>
      <td>
        <xsl:value-of select="skinname"/>
      </td>
      <td>
        <xsl:value-of select="condition"/>
      </td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>