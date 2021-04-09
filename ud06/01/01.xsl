<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 8 de abril de 2021, 9:50
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="edificio">
        <html>
            <head>
                <title>01 XSLT Isabel Mtnez Guerra</title>
                <link rel="icon" href="../../images/favicon.png" type="image/png"/>
                <link rel="stylesheet" href="01.css" type="text/css"/>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <ul>
                    <xsl:apply-templates select="vivienda"/>
                    <li>Número de viviendas: <xsl:value-of select="count(vivienda)"/></li>
                    <li>Número de vecinos: <xsl:value-of select="count(//nombre)"/></li>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="vivienda">
        <li>
            Piso:<xsl:value-of select="piso"/> Puerta:<xsl:value-of select="puerta"/>
            <ol>
                <xsl:apply-templates select="vecinos/nombre"/>
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="nombre">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>
