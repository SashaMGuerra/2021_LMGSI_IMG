<?xml version="1.0" encoding="UTF-8"?>

<!-- Autor: Sasha. Fecha: 27/5/21 -->
<!--
    Document   : signos.xsl
    Created on : 14 de junio de 2019, 11:12
    Author     : 
    Description:
        Mostrar horoscopo / los signos del zodiaco
	-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="../../libWeb.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="'Horóscopo'"/>
                    <xsl:with-param name="description" select="'XSLT de un horóscopo'"/>
                    <xsl:with-param name="linkestilo" select="'css/estilos.css'"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>HORÓSCOPO - SIGNOS DEL ZODÍACO</h1>
                <xsl:apply-templates select="//signo"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="signo">
        <div class="signo">
            <div class="imagenes">
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/bg-', @id, '.jpg')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="nombre"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/', @id, '.svg')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="nombre"/>
                    </xsl:attribute>
                </xsl:element>
            </div>
            <p><xsl:value-of select="nombre"/></p>
            <div class="fecha">
                <xsl:value-of select="fecha"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>