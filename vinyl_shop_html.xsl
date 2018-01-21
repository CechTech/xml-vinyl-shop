<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs fd"
    xmlns:fd="urn:cecj02:namespace:vinyl_shop" version="2.0">
    <xsl:output name="html" encoding="UTF-8" doctype-system="http://www.w3.org/TR/html4/loose.dtd"
        doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

    <!-- index -->
    <xsl:template match="/">
        <xsl:result-document href="index.html" format="html">
            <html>
                <head>
                    <title>
                        <xsl:text>Vinyl Shop</xsl:text>
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

    <!-- layout -->
    <xsl:template match="fd:vinyl_shop">
        <div id="page">
            <div id="header">
                <h1>Vinyl Shop</h1>
                <xsl:apply-templates select="fd:autor"/>
            </div>
            <div id="content">
                <xsl:apply-templates select="fd:hudebni_dila"/>
            </div>
            <div id="footer">2018 - Vinyl shop</div>
        </div>
    </xsl:template>

    <!-- header -->
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

    <!-- katalog -->
    <xsl:template match="fd:hudebni_dila">
        <table class="katalog">
            <tr class="nadpisy">
                <td>Obrázek</td>
                <td>Název</td>
                <td>Umělci</td>
                <td>Vydavatel</td>
                <td>Rok</td>
                <td>Typ</td>
                <td>Žánr</td>
                <td>Stav</td>
                <td>Cena</td>
                <td>Dostupnost</td>
            </tr>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="fd:dilo">
        <tr class="dilo">
            <td>
                <xsl:apply-templates select="fd:obrazek"/>
            </td>
            <td>
                <h3>
                    <a href="{generate-id(.)}.html">
                        <xsl:value-of select="fd:nazev"/>
                    </a>
                </h3>
            </td>
            <td>
                <xsl:apply-templates select="fd:umelci"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:vydavatel/fd:nazev"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:vydano/fd:rok"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:typ"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:zanry"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:stav"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:cena"/>
            </td>
            <td>
                <xsl:apply-templates select="fd:dostupnost"/>
            </td>
        </tr>
        <xsl:result-document href="{generate-id(.)}.html" format="html">
            <html>
                <head>
                    <title>
                        <xsl:text>Vinyl Shop</xsl:text>
                        <xsl:apply-templates select="fd:nazev"/>
                    </title>
                    <link rel="stylesheet" type="text/css" href="styles.css"/>
                </head>
                <body>
                    <div id="page">
                        <div id="header">
                            <h1>Vinyl Shop</h1>
                            <xsl:apply-templates select="//fd:autor"/>
                        </div>
                        <div class="detail">
                            <div class="info">
                                <xsl:apply-templates select="fd:obrazek" mode="detail"/>
                                <xsl:apply-templates select="fd:nazev" mode="detail"/>
                                <xsl:apply-templates select="fd:umelci" mode="detail"/>
                                <xsl:apply-templates select="fd:vydavatel" mode="detail"/>
                                <xsl:apply-templates select="fd:vydano" mode="detail"/>
                                <xsl:apply-templates select="fd:vydavatel/fd:zeme" mode="detail"/>
                                <xsl:apply-templates select="fd:typ" mode="detail"/>
                                <xsl:apply-templates select="fd:format" mode="detail"/>
                                <xsl:apply-templates select="fd:zanry" mode="detail"/>
                                <xsl:apply-templates select="fd:stav" mode="detail"/>
                                <xsl:apply-templates select="fd:cena" mode="detail"/>
                                <xsl:apply-templates select="fd:dostupnost" mode="detail"/>
                                <xsl:apply-templates select="fd:obsah" mode="detail"/>
                            </div>

                            <div class="zpet">
                                <a href="index.html">Zpět</a>
                            </div>
                        </div>
                        <div id="footer">2018 - Vinyl shop</div>
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
            <xsl:if test="position() > 1">, </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="fd:cena">
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@mena"/>
    </xsl:template>
    <xsl:template match="fd:obrazek">
        <xsl:if test="@src">
            <img src="images\{@src}" alt="{../fd:nazev}" title="{../fd:nazev}"
                class="img" height="150" width="150" />
        </xsl:if>
        <xsl:if test="not(@src)">
            <xsl:text>Obrázek není k dispozici</xsl:text>
        </xsl:if>
    </xsl:template>

    <!-- detail -->
    <xsl:template match="fd:obrazek" mode="detail">
        <div class="obrazek">
            <xsl:if test="@src">
                <img src="images\{@src}" alt="{../fd:nazev}"
                    title="{../fd:nazev}" class="img"/>
            </xsl:if>
            <xsl:if test="not(@src)">
                <xsl:text>Obrázek není k dispozici</xsl:text>
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
        <div class="umelci">
            <h3>
                <xsl:text>Umělec</xsl:text>
            </h3>
            <p>
                <xsl:for-each select="fd:umelec">
                    <xsl:if test="position() > 1">, </xsl:if>
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </p>
        </div>
    </xsl:template>
    
    <!-- vydavatel -->
    <xsl:template match="fd:vydavatel" mode="detail">
        <div class="vydavatel">
            <h3>
                <xsl:text>Vydavatel</xsl:text>
            </h3>
            <p>
                <xsl:value-of select="fd:nazev"/>
            </p>
        </div>
    </xsl:template>

    <!-- vydano -->
    <xsl:template match="fd:vydano" mode="detail">
        <div class="vydano">
            <h3>
                <xsl:text>Vydáno</xsl:text>
            </h3>
            <p>
                <xsl:value-of select="fd:rok"/>
            </p>
        </div>
    </xsl:template>
    
    <!-- zeme -->
    <xsl:template match="fd:vydavatel/fd:zeme" mode="detail">
        <div class="zeme">
            <h3>
                <xsl:text>Země</xsl:text>
            </h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    
    <!-- typ -->
    <xsl:template match="fd:typ" mode="detail">
        <div class="typ">
            <h3>
                <xsl:text>Typ</xsl:text>
            </h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    
    <!-- format -->
    <xsl:template match="fd:format" mode="detail">
        <div class="format">
            <h3>
                <xsl:text>Formát</xsl:text>
            </h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    
    <!-- zanry -->
    <xsl:template match="fd:zanry" mode="detail">
        <div class="zanry">
            <h3>
                <xsl:text>Žánr</xsl:text>
            </h3>
            <p>
                <xsl:for-each select="fd:zanr">
                    <xsl:if test="position() > 1">, </xsl:if>
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </p>
        </div>
    </xsl:template>
    
    <!-- stav -->
    <xsl:template match="fd:stav" mode="detail">
        <div class="stav">
            <h3>
                <xsl:text>Stav</xsl:text>
            </h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    
    <!-- cena -->
    <xsl:template match="fd:cena" mode="detail">
        <div class="cena">
            <h3>
                <xsl:text>Cena</xsl:text>
            </h3>
            <p>
                <xsl:apply-templates/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@mena"/>
            </p>
        </div>
    </xsl:template>

    <!-- dostupnost -->
    <xsl:template match="fd:dostupnost" mode="detail">
        <div class="dostupnost">
            <h3>
                <xsl:text>Dostupnost</xsl:text>
            </h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    
    <!-- obsah -->
    <xsl:template match="fd:obsah" mode="detail">
        <div class="obsah">
            <h3>
                <xsl:text>Skladby</xsl:text>
            </h3>
            <table>
                <xsl:for-each select="fd:vinyl">
                    <xsl:for-each select="fd:strana">
                        <xsl:for-each select="fd:skladba">
                            <tr>
                                <td class="kod-skladby">
                                    <xsl:value-of select="../fd:kod"/>
                                    <xsl:value-of select="fd:cislo"/>
                                </td>
                                <td class="nazev-skladby">
                                    <xsl:value-of select="fd:nazev"/>
                                </td>                       
                                <td class="delka-skladby">
                                    <xsl:value-of select="format-number(floor(fd:delka div 60) mod 60, '0')"/>
                                    <xsl:value-of select="format-number(fd:delka mod 60, ':00')"/>
                                </td>   
                            </tr>                   
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>
