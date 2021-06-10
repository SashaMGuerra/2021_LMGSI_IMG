<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05AXml.xsl
    Created on : 10 de junio de 2021, 9:04
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
        <xsl:element name="{//database/@name}">
            <xsl:for-each select="//table_data">
                <xsl:element name="{@name}">
                    <xsl:for-each select="row">
                        <xsl:element name="{name(.)}">
                            <xsl:for-each select="field">
                                <xsl:element name="{@name}">
                                    <xsl:value-of select="current()"/>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
