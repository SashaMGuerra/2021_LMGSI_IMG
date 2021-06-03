<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : horoscopo.xsl
Created on : 11 de junio de 2019, 11:12
Author     : Amor Rodríguez Navarro
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="signoZodiaco" select="1"/>
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/horoscope">
        <xsl:apply-templates select="sign"/>
    </xsl:template>


    <xsl:template match="sign">
        <xsl:if test="$signoZodiaco=@id">
            <html>
                <head>
                    <meta charset="utf-8"/>
                    <meta name="author" content="Amor Rodríguez Navarro"/>
                    <link rel="shortcut icon" type="image/jpg" href="favicon.jpg"/>
                    <link href="css/estilos.css" rel="stylesheet" type="text/css" title="estilos por defecto"/>
                    <title>Horoscopo <xsl:value-of select="document('signos.xml')//signo[@id=current()/@id]/nombre"/></title>
                    <style>
                
                    </style>
                </head>
                <body>
                    <header>
                        <figure>

                            <img>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="concat('bg-',@id,' borderSigno')"/>
                                </xsl:attribute>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('images\',@id,'.svg')"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="concat('Consulta del horoscopo de ',nombre)"/>
                                </xsl:attribute>
                            </img>

                        </figure>
                        <h1>
                            HORÓSCOPO  <xsl:value-of select="document('signos.xml')//signo[@id=current()/@id]/nombre"/>

                        </h1>
                    </header>
                    <main>
                        <h2>Predicción para hoy <xsl:value-of select="../date"/>
                        </h2>
                        <div id="mensaje"  class="borderSigno">
                            <xsl:value-of select="./message"/>

                        </div>
                    </main>

                </body>
            </html>
        </xsl:if>

    </xsl:template>
</xsl:stylesheet>
