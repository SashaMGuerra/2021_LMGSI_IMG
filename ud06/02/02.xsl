<?xml version="1.0" encoding="UTF-8"?>

<!-- Autor: Sasha. Fecha de creación: 28/04/2021 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:apply-templates select="listatickets/comment()"/>
        <html>
            <head>
                <title>02 XSLT Isabel Mtnez. Guerra</title>
                <style>
                    table, td, th{
                        border: 1px solid black;
                    }
                    table{
                        border-collapse: collapse;
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                    <h2>Listado de tickets</h2>
                    <xsl:apply-templates match="listatickets/ticket"/>
                </header>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="listatickets/comment()">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>
    
    <xsl:template match="listatickets/ticket">
        <h3>Ticket: <xsl:value-of select="numero"/></h3>
        <table>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
            </tr>
            <tr>
                <th>Total</th>
                <xsl:variable name="preciototal" select="0"/>
                <th>
                    <xsl:for-each select="producto/precio">
                        <xsl:variable name="preciototal">
                            <xsl:value-of select="$preciototal+number(current())"/>
                        </xsl:variable>
                        <xsl:value-of select="$preciototal"/>
                        <br/>
                    </xsl:for-each>
                </th>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="producto">
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="precio"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
