<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05ATexto.xsl
    Created on : 10 de junio de 2021, 9:14
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:value-of select="concat('CREATE DATABASE IF NOT EXISTS ', //database/@name, ';')"/>
        <xsl:for-each select="//table_structure">
    CREATE TABLE <xsl:value-of select="@name"/>(
    <xsl:apply-templates select="field"/>);
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="field">
        <xsl:choose>
            <xsl:when test="@Field=(../field[last()]/@Field)">
                <xsl:value-of select="concat(@Field, ' ', @Type)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(@Field, ' ', @Type, ', ')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
