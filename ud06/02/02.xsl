<?xml version="1.0" encoding="UTF-8"?>

<!-- Autor: Sasha. Fecha de creación: 28/04/2021 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                <title>02 XSLT Isabel Mtnez. Guerra</title>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" href="02.css" type="text/css"/>
                <link rel="icon" href="../../images/favicon.png" type="image/png"/>
                <meta name="author" content="Sasha"/>
                <meta name="application-name" content="AppWeb de Sasha"/>
                <meta name="description" content="Información sobre tickets"/>
                <meta name="keywords" content="tickets, total, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                    <h2>Listado de tickets</h2>
                </header>
                <div>
                    <xsl:apply-templates match="listatickets/ticket" mode="no_comments"/>
                </div>
                <div>
                    <xsl:attribute name="class">abajo</xsl:attribute>
                    <p>Número de tickets: <xsl:value-of select="count(//ticket)"/></p>
                    <p>Total de tickets: <xsl:value-of select="sum(//total)"/></p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve"/> 
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>
    
    <xsl:template match="listatickets/ticket" mode="no_comments">
        <xsl:decimal-format name="espanyol" decimal-separator="," grouping-separator="."/>
        <h3>Ticket: <xsl:value-of select="numero"/></h3>
        <table>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
            </tr>
            <xsl:apply-templates select="producto"/>
            <tr>
                <th>Total</th>
                <xsl:variable name="preciototal" select="0"/>
                <th>
                    <xsl:value-of select="format-number(total, '#0,00€', 'espanyol')"/>
                </th>
            </tr>
            <tr>
                <th colspan="2">
                    <xsl:variable name="dia" select="substring(fecha, 9, 2)"/>
                    <xsl:variable name="mes" select="substring(fecha, 6, 2)"/>
                    <xsl:variable name="anyo" select="substring(fecha, 1, 4)"/>
                    <xsl:value-of select="concat('Fecha de ticket: ',$dia,'-',$mes,'-',$anyo)"/>
                </th>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="producto">
        <xsl:decimal-format name="espanyol" decimal-separator="," grouping-separator="."/>
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td>
                <xsl:value-of select="format-number(precio, '#0,00', 'espanyol')"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
