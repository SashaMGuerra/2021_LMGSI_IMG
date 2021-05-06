<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : prueba.xsl
    Created on : 6 de mayo de 2021, 9:18
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="horario">
        <html>
            <head>
                <title>prueba.xsl</title>
                <style>
                    table, td, th{
                        border: 1px solid black;
                    }
                </style>
            </head>
            <body>
                <table>
                    <xsl:apply-templates select="//dia_sem"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="dia_sem">
        <!-- Lista de profesores, tomada mediante el código de asignatura -->
        <xsl:variable name="profesores" select="//asignatura[@codM=current()]/@codProfesor"/>
        <tr>
            <xsl:for-each select="$profesores">
                <td>
                    <xsl:value-of select="."/>
                </td>
            </xsl:for-each>
        </tr>
        <!-- La plantilla recoge los profesores por cada valor de $profesores -->
        <xsl:apply-templates select="//profesores/profesor[contains($profesores, @codP)]"/>
    </xsl:template>
    
    <!-- La plantilla se aplica a la etiqueta "profesor" -->
    <xsl:template match="profesor">
        <tr>
            <td>
                <xsl:value-of select="text()"/>
            </td>
        </tr>
    </xsl:template>



</xsl:stylesheet>
