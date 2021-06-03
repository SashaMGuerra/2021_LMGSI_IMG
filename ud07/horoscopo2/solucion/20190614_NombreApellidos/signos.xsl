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
    <xsl:template match="/horoscopo">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="author" content="Amor Rodríguez Navarro"/>
                <link rel="shortcut icon" type="image/jpg" href="favicon.jpg"/>
                <link href="css/estilos.css" rel="stylesheet" type="text/css" title="estilos por defecto"/>                
                <style>
          
                </style>
                <title>Horoscopo diario, descubre tu horóscopo</title>
            </head>
            <body>
                <header>
                    <h1>
                        HORÓSCOPO / SIGNOS DEL ZODÍACO						
                    </h1>
                </header>
                <main>
                    <xsl:apply-templates select="signo">
                        <xsl:sort select="@id"/>                   
                    </xsl:apply-templates>
                </main>
               
            </body>
        </html>
    </xsl:template>
    <xsl:template match="signo">
        <div class="signoZodiaco">
            <figure>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('horoscopo\',nombre,'\horoscopo.xml')"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="concat('Consulta el horóscopo de ',nombre)"/>
                    </xsl:attribute>
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
                </a>	
            </figure>
            <h2>
                <xsl:value-of select="nombre"/>
            </h2>
            <h3>
                <xsl:value-of select="fecha"/>
            </h3>
        </div>
	
		
	
    </xsl:template>
</xsl:stylesheet>
