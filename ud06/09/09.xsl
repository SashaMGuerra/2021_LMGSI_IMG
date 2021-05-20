<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 09.xsl
    Created on : 18 de mayo de 2021, 12:31
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="../libWeb.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="description" select="'Listado de carreras'"/>
                    <xsl:with-param name="titulo" select="'XSLT 09'"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>09 XSLT <xsl:value-of select="/universidad/nombre"/></h1>
                <xsl:for-each select="//carreras/carrera">
                    <xsl:sort select="nombre"/>
                    <div>
                        <h2>
                            <xsl:value-of select="concat(@id, ' - ', nombre, ' (', plan,')')"/>
                        </h2>
                        <div class="interior">
                            <xsl:value-of select="centro"/><br/>
                            <ul>
                                <xsl:apply-templates select="//asignatura[@titulacion=(current()/@id)]">
                                    <xsl:sort select="nombre"/>
                                </xsl:apply-templates>
                            </ul>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="asignatura">
        <li>
            <xsl:value-of select="concat('(',@id,') ',nombre)"/>
            <ol>
                <xsl:apply-templates select="//alumno[estudios//asignatura/@codigo=(current()/@id)]">
                    <xsl:sort select="apellido1"/>
                </xsl:apply-templates>
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="alumno">
        <li>
            <xsl:element name="abbr">
                <xsl:attribute name="title">
                    <xsl:value-of select="../../carreras/carrera[@id=(current()//carrera/@codigo)]/nombre"/>
                </xsl:attribute>
                <xsl:value-of select="concat(apellido1, ' ', apellido2, ', ',nombre)"/>
            </xsl:element>
        </li>
    </xsl:template>

</xsl:stylesheet>
