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

    <xsl:template match="/">
        <xsl:apply-templates select="factura"/>
    </xsl:template>
    
    <xsl:template match="factura">
        <factura>
            <xsl:copy-of select="datos_emisor"/>
        </factura>
    </xsl:template>

</xsl:stylesheet>