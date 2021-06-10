<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05AWeb.xsl.xsl
    Created on : 10 de junio de 2021, 8:34
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="lib/libWeb.xsl"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        
        <xsl:call-template name="DocTipo"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="'Examen 10/06/2021'"/>
                    <xsl:with-param name="description" select="'Prueba de XSLT'"/>
                    <xsl:with-param name="linkestilo" select="'css/estilo.css'"/>
                </xsl:call-template>
            </head>
            <body>
                <div>
                    <h1>Base de Datos: <xsl:value-of select="//database/@name"/></h1>
                </div>
                <xsl:apply-templates select="//table_data[@name!='GRADO']"/>
                <footer>
                    <div>Realizado por Isabel Martínez Guerra</div>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="table_data">
        <h2>Tabla: <xsl:value-of select="@name"/></h2>
        <table>
            <tr>
                <xsl:for-each select="row[1]/field">
                    <th><xsl:value-of select="@name"/></th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <xsl:for-each select="field">
                        <td><xsl:value-of select="."/></td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

</xsl:stylesheet>
