<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 13 de abril de 2021, 12:55
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
                <title>Horario</title>
                <style>
                    *{
                        text-align: center;
                    }
                    table, td, tr{
                        border-collapse: collapse;
                        border: 1px solid black;
                    }
                    td{
                        padding: 0.5%;
                    }
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Hora</th>
                        <th>Lunes</th>
                        <th>Martes</th>
                        <th>Miércoles</th>
                        <th>Jueves</th>
                        <th>Viernes</th>
                    </tr>
                    <xsl:apply-templates select="grupo/hora"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="grupo/hora">
        <tr>
            <td><xsl:value-of select="concat(@entrada, '-', @salida)"/></td>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="dia_sem">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    <xsl:template match="imparte">
        
    </xsl:template>

</xsl:stylesheet>
