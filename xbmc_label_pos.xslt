<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8" />

  <!-- copy template -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- copy anything under layouts -->
  <xsl:template match="itemlayout|focusedlayout">
    <xsl:copy-of select="."/>
  </xsl:template>

  <!-- filter out all non-labels -->
  <xsl:template match="control">
    <xsl:copy>
      <xsl:choose>
        <xsl:when test="@type='label' and align='right'">
          <xsl:for-each select="@*|node()">
            <xsl:choose>
              <xsl:when test="name()='posx'">
                <right><xsl:value-of select="." /></right>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="."/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="control">
    <xsl:copy>
      <xsl:choose>
        <xsl:when test="@type='label' and align='left'">
          <xsl:for-each select="@*|node()">
            <xsl:choose>
              <xsl:when test="name()='posy'">
                <left><xsl:value-of select="." /></left>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="."/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
