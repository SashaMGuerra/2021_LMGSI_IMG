<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : libWeb.xsl
    Created on : 11 de mayo de 2021, 8:09
    Author     : amor
    Description:
       Plantillas comunes a todas las páginas web
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <!--  Escribir las tag META de la web y el favicon    -->
    <xsl:template name="metaWeb">
        <xsl:param name="titulo"/>
        <xsl:param name="keywords" select="'xml, xslt'"/>
        <xsl:param name="description" select="'Ejercicio de LMGSI'"/>
        <xsl:param name="linkestilo" select="estilo.css"/> 
       
        <!--Etiquetas meta-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
        <meta name="author" content="Sasha"/>
        <meta name="application-name" content="AppWeb de LMSGI"/>
        <meta name="description">
            <xsl:attribute name="content">
                <xsl:value-of select="$description"/>
            </xsl:attribute>
        </meta>
        <meta name="keywords">
            <xsl:attribute name="content">
                <xsl:value-of select="$keywords"/>
            </xsl:attribute>
        </meta>
        <meta name="robots" content="index, follow"/>      
        <link rel="stylesheet" type="text/css">
            <xsl:attribute name="href">
                <xsl:value-of select="$linkestilo"/>
            </xsl:attribute>
        </link>
        <link rel="icon" href="../../images/favicon.png" type="image/png"/>
        <title>
            <xsl:value-of select="concat($titulo)"/>
        </title>
    </xsl:template>
    <!--  *********************Escribir el DocType -->
    <xsl:template name="DocTipo">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    </xsl:template>
    <!-- Copiar los comentario -->
    <xsl:template match="comment()"> 
        <xsl:text xml:space="preserve">  
        <xsl:comment>
                <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
