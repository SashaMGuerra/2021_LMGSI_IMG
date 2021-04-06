<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 14 de abril de 2020, 9:08
    Author     : amor
    Description:
        Transformacion de 01.xml en un archivo con la lista de nombres y apellidos
                Usando una sola plantilla (xsl:template)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>  
    
    <xsl:template match="alumnos">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Ejemplo de plantilla - Alumnos</title>
                <style>
                    td{border: 1px solid black; padding: 5px;}
                    table{border-collapse: collapse;}
                </style>
            </head>
            <body>
                <table>
                    <caption>Alumnos</caption>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Dirección</th>
                    </tr>
                    <xsl:apply-templates select="alumno"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="alumno">
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="apellido"/></td>
            <td><ol><xsl:apply-templates select="direccion"/></ol></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="direccion">
        <li><xsl:value-of select="concat(poblacion, ' ', cp)"/></li>
    </xsl:template>

</xsl:stylesheet>
