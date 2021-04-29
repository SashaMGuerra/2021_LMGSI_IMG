<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 06.xsl
    Created on : 29 de abril de 2021, 10:10
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <root>
            <xsl:for-each select="root/row">
                <row>
                    <anyo><xsl:value-of select="@Anyo"/></anyo>
                    <concepto><xsl:value-of select="@Concepto"/></concepto>
                    <usuarios><xsl:value-of select="@Usuarios_registrados"/></usuarios>
                </row>
            </xsl:for-each>
        </root>
    </xsl:template>

</xsl:stylesheet>
