<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 07.xsl
    Created on : 7 de mayo de 2021, 9:10
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="corregido" select="'no'"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>07 XSLT Test SINF - Isabel Mtnez. Guerra</title>
                <link rel="stylesheet" href="07.css" type="text/css"/>
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="//nombreCiclo"/></h1>
                    <h2><xsl:value-of select="document('1dawModulos.xml')//modulo[@codM=(current()//nombreModulo)]"/></h2>
                    <h3>Fecha: <xsl:value-of select="concat(//fecha/dia, ' de ', (document('meses.xml')/meses/mes[@id=(current()//mes)]), ' de ', //fecha/anyo)"/></h3>
                </header>
                <form method="get" action="/formulario07.php">
                    <fieldset>
                        <ol>
                            <xsl:apply-templates select="//pregunta"/>
                        </ol>
                    </fieldset>
                    <xsl:if test="$corregido!='si'">
                        <fieldset class="abajo">
                            <input type="reset" value="Limpiar formulario"/>
                            <input type="submit" value="Enviar formulario"/>
                        </fieldset>
                    </xsl:if>
                </form>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="pregunta">
        <li>
            <xsl:value-of select="enunciado"/>
            <ul>
                <xsl:for-each select="respuestas/respuesta">
                    <xsl:variable name="identificador" select="../../@id"/>
                    <li class="conhover">
                        <input type="radio">
                            <xsl:attribute name="name">
                                <xsl:value-of select="concat('p', $identificador)"/>
                            </xsl:attribute>
                            <xsl:attribute name="id">
                                <xsl:value-of select="concat('r', $identificador, position())"/>
                            </xsl:attribute>
                            <xsl:if test="$corregido='si'">
                                <xsl:attribute name="disabled"/>
                                <xsl:if test="@correcta='correcta'">
                                    <xsl:attribute name="checked"/>
                                </xsl:if>
                            </xsl:if>
                        </input>
                        <label>
                            <xsl:attribute name="for">
                                <xsl:value-of select="concat('r', $identificador, position())"/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>  
                        </label>
                    </li>
                </xsl:for-each>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>
