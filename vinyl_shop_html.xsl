<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs fd"
    xmlns:fd="urn:cecj02:namespace:vinyl_shop" version="2.0">
    <xsl:output name="html" encoding="UTF-8" doctype-system="http://www.w3.org/TR/html4/loose.dtd"
        doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

    <!-- MAINPAGE -->
    <xsl:template match="/">
        <xsl:result-document href="index.html" format="html">
            <html>
                <head>
                    <title>
                        <xsl:text>Katalog gramodesek</xsl:text>
                        <xsl:value-of select="fd:jmeno"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="fd:prijmeni"/>
                    </title>
                    <link rel="stylesheet" type="text/css" href="styles.css"/>
                </head>
                <body>
                    <xsl:apply-templates/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- LAYOUT -->
    <xsl:template match="fd:vinyl_shop">
        <div id="page">
            <div id="header">
                <h1>Katalog gramodesek</h1>
                <xsl:apply-templates select="fd:autor"/>
            </div>
            <div id="content">
                <xsl:apply-templates select="fd:hudebni_dila"/>
            </div>
            <div id="footer"> 2018 - Vinyl shop </div>
        </div>
    </xsl:template>

    <!-- HEADER -->
    <xsl:template match="fd:autor">
        <div id="autor">
            <div id="jmeno">
                <h3>
                    <xsl:text>Autor: </xsl:text>
                    <xsl:value-of select="fd:jmeno"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="fd:prijmeni"/>
                </h3>
            </div>
            <div id="kontakt">
                <xsl:text>Email: </xsl:text>
                <xsl:value-of select="fd:email"/>
            </div>
        </div>
    </xsl:template>

    <!-- CONTENT - MAINPAGE -->
    <xsl:template match="fd:hudebni_dila">
        <div id="seznam">
            <table>
                <tr class="titulky">
                    <td>Obrázek</td>
                    <td>Název</td>
                    <td>Umělci</td>
                    <td>Vydavatel</td>
                    <td>Rok</td>
                    <td>Typ</td>
                    <td>Formát</td>
                    <td>Žánr</td>
                    <td>Stav</td>
                    <td>Cena</td>
                    <td>Dostupnost</td>
                </tr>
                <xsl:apply-templates/>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="fd:dilo">
        <tr class="film-radek">
            <td class="td1">
                <xsl:apply-templates select="fd:obrazek"/>
            </td>
            <td class="td2">
                <h3>
                    <a href="{generate-id(.)}.html">
                        <xsl:value-of select="fd:nazev"/>
                    </a>
                </h3>
            </td>
            <td class="td3">
                <xsl:apply-templates select="fd:umelci"/>
            </td>
            <td class="td4">
                <xsl:apply-templates select="fd:vydavatel/fd:nazev"/>
            </td>
            <td class="td5">
                <xsl:apply-templates select="fd:vydano/fd:rok"/>
            </td>
            <td class="td6">
                <xsl:apply-templates select="fd:typ"/>
            </td>
            <td class="td7">
                <xsl:apply-templates select="fd:format"/>
            </td>
            <td class="td8">
                <xsl:apply-templates select="fd:zanry"/>
            </td>
            <td class="td9">
                <xsl:apply-templates select="fd:stav"/>
            </td>
            <td class="td10">
                <xsl:apply-templates select="fd:cena"/>
            </td>
            <td class="td11">
                <xsl:apply-templates select="fd:dostupnost"/>
            </td>
        </tr>
        <xsl:result-document href="{generate-id(.)}.html" format="html">
            <html>
                <head>
                    <title>
                        <xsl:text> Vinyl shop </xsl:text>
                        <xsl:apply-templates select="fd:nazev"/>
                    </title>
                    <link rel="stylesheet" type="text/css" href="styles.css"/>
                </head>
                <body>
                    <div id="page">
                        <div id="header">
                            <xsl:apply-templates select="//fd:autor"/>
                        </div>
                        <div id="content-detail">
                            <div class="part1">
                                <xsl:apply-templates select="fd:obrazek" mode="detail"/>
                                <xsl:apply-templates select="fd:nazev" mode="detail"/>
                                <xsl:apply-templates select="fd:umelci" mode="detail"/>
                                <xsl:apply-templates select="fd:vydavatel" mode="detail"/>
                                <xsl:apply-templates select="fd:vydano" mode="detail"/>
                                <xsl:apply-templates select="fd:typ" mode="detail"/>
                                <xsl:apply-templates select="fd:format" mode="detail"/>
                                <xsl:apply-templates select="fd:zanry" mode="detail"/>
                            </div>

                            <div class="part2">
                                <xsl:apply-templates select="fd:stav" mode="detail"/>
                                <xsl:apply-templates select="fd:cena" mode="detail"/>
                                <xsl:apply-templates select="fd:dostupnost" mode="detail"/>
                            </div>
                            <div class="part3">
                                <xsl:apply-templates select="fd:obsah" mode="detail"/>
                            </div>

                            <div class="back-button">
                                <a href="index.html" title="Zpět na hlavní stránku">Zpět</a>
                            </div>
                        </div>
                        <div id="footer"> 2018 - Vinyl shop </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="fd:umelci">
            <xsl:for-each select="fd:umelec">
                <xsl:if test="position() > 1">, </xsl:if>
                <xsl:value-of select="." />
            </xsl:for-each>
    </xsl:template>
    <xsl:template match="fd:zanry">
        <xsl:for-each select="fd:zanr">
            <xsl:value-of select="."/>
            <br />
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="fd:cena">
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@mena"/>
        <br/>
    </xsl:template>
    <xsl:template match="fd:obrazek">
        <xsl:if test="@src">
            <div class="image-box">
                <img src="images\{@src}" alt="{../fd:nazev}" title="{../fd:nazev}"
                    class="img" height="150"/>
            </div>
        </xsl:if>
        <xsl:if test="not(@src)">
            <div class="plakat-miss">
                <xsl:text>Plakát není k dispozici</xsl:text>
            </div>
        </xsl:if>
    </xsl:template>

    <!-- CONTENT DETAIL -->
    <xsl:template match="fd:obrazek" mode="detail">
        <div class="plakat">
            <xsl:if test="@src">
                <div class="image-box">
                    <img src="images\{@src}" alt="{../fd:nazev}"
                        title="{../fd:nazev}" class="img"/>
                </div>
            </xsl:if>
            <xsl:if test="not(@src)">
                <div class="plakat-miss">
                    <xsl:text>Plakát není k dispozici</xsl:text>
                </div>
            </xsl:if>
        </div>
    </xsl:template>

    <!-- nazev -->
    <xsl:template match="fd:nazev" mode="detail">
        <div class="nazev">
            <h2>
                <xsl:apply-templates/>
            </h2>
        </div>
    </xsl:template>

    <!-- umelci -->
    <xsl:template match="fd:umelci" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Umělec</xsl:text>
            </h3>
            <xsl:for-each select="fd:umelec">

                    <xsl:value-of select="."/>
                <br />
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <!-- vydavatel -->
    <xsl:template match="fd:vydavatel" mode="detail">
        <div class="popis">
            <h3>Vydavatel</h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>

    <!-- vydano -->
    <xsl:template match="fd:vydano" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Vydáno</xsl:text>
            </h3>
            <xsl:value-of select="fd:rok"/>
        </div>
    </xsl:template>
    
    <!-- typ -->
    <xsl:template match="fd:typ" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Typ</xsl:text>
            </h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- format -->
    <xsl:template match="fd:format" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Formát</xsl:text>
            </h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- zanry -->
    <xsl:template match="fd:zanry" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Žánr</xsl:text>
            </h3>
            <xsl:for-each select="fd:zanr">
                 <xsl:value-of select="."/>
                <br />
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <!-- stav -->
    <xsl:template match="fd:stav" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Stav</xsl:text>
            </h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- cena -->
    <xsl:template match="fd:cena" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Cena</xsl:text>
            </h3>
            <xsl:apply-templates/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@mena"/>
        </div>
    </xsl:template>

    <!-- dostupnost -->
    <xsl:template match="fd:dostupnost" mode="detail">
        <div class="popis">
            <h3>
                <xsl:text>Dostupnost</xsl:text>
            </h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="fd:skladba/fd:nazev" mode="detail">
        <div class="obsah">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="fd:skladba/fd:nazev" mode="detail">
        <div class="obsah">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>
