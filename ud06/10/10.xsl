<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 10.xsl
    Created on : 18 de mayo de 2021, 13:36
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="network">
        <xsl:variable name="newline">
            <xsl:value-of disable-output-escaping="yes" select="'&#10;'"/>
        </xsl:variable>
        <xsl:variable name="newtab">
            <xsl:value-of disable-output-escaping="yes" select="'&#9;'"/>
        </xsl:variable>
        <xsl:value-of select="concat(name(current()), ':')"/>
        <xsl:text><xsl:value-of select="concat($newline, $newtab)"/></xsl:text>
        <xsl:value-of select="concat(name(//ethernets), ':')"/>
    </xsl:template>

</xsl:stylesheet>