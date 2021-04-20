<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 13 de abril de 2021, 12:55
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="horario">
        <html>
            <head>
                <title>Horario</title>
                <style>
                    *{
                        font-family: Calibri, monospace;
                        text-align: center;
                    }
                    table{
                        text-align: center;
                        width: 100%;
                        table-layout: fixed;
                    }
                    table, td, tr, th{
                        border-collapse: collapse;
                        border: 1px solid black;
                    }
                    caption{
                        font-variant: small-caps;
                        margin-bottom: 2%;
                    }
                    div{
                        margin-bottom: 3%;
                    }
                    div.caja{
                        margin-bottom: auto;
                        width: 49.5%;
                        display: inline-block;
                    }
                </style>
            </head>
            <body>
                <div>
                    <div class="caja">
                        <h2>Módulos</h2>
                        <table>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                            </tr>
                            <xsl:for-each select="modulos/modulo">
                                <tr>
                                    <td><xsl:value-of select="@codM"/></td>
                                    <td><xsl:value-of select="."/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                    <div class="caja">
                        <h2>Profesores</h2>
                        <table>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                            </tr>
                            <xsl:for-each select="profesores/profesor">
                                <tr>
                                    <td><xsl:value-of select="@codP"/></td>
                                    <td><xsl:value-of select="."/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                    <div>
                        <h2>Asignaturas</h2>
                        <table>
                            <tr>
                                <th>Asignatura</th>
                                <th>Profesor</th>
                            </tr>
                            <xsl:for-each select="imparte/asignatura">
                                <tr>
                                    <td><xsl:value-of select="../../modulos/modulo[@codM=(current()/@codM)]/."/></td>
                                    <td><xsl:value-of select="../../profesores/profesor[@codP=substring((current()/@codProfesor),1,3)]/."/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </div>
                <xsl:for-each select="grupo">
                    <div>
                        <table>
                            <caption>Horario del curso <xsl:value-of select="@idgrupo"/>
                            <br/>Tutor: <xsl:value-of select="../profesores/profesor[@codP=(current()/@codT)]/."/></caption>
                            <tr>
                                <th>Hora</th>
                                <th>Lunes</th>
                                <th>Martes</th>
                                <th>Miércoles</th>
                                <th>Jueves</th>
                                <th>Viernes</th>
                            </tr>
                            <xsl:apply-templates select="hora"/>
                        </table>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="hora">
        <tr>
            <td><xsl:value-of select="concat(@entrada, '-', @salida)"/></td>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="dia_sem">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="../../../modulos/modulo[@codM=current()]/."/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </abbr>
            <br/>
            <xsl:value-of select="../../../imparte/asignatura[@codM=current()]/@codProfesor"/>
        </td>
    </xsl:template>
</xsl:stylesheet>
