<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 27 de abril de 2021, 12:17
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

    <!-- Stylesheet to remove all namespaces from a document -->
    
    <!-- template to copy elements -->
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <!--
            <xsl:apply-templates select="@* | node()"/> -->
        </xsl:element>
    </xsl:template>

    <!-- template to copy attributes -->
    <xsl:template match="@*">
        <xsl:choose>
            <xsl:when test="current()='04.xsd'">
            </xsl:when>
            <xsl:when test="current()='http://www.w3.org/2001/XMLSchema-instance'">
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- template to copy the rest of the nodes -->
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- <xsl:copy/> -->
    </xsl:template>
    
</xsl:stylesheet>