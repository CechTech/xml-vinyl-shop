<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fd="urn:cecj02:namespace:vinyl_shop"
    exclude-result-prefixes="xsl fo fd" version="2.0">
    
        <xsl:template match="/">
        <fo:root font-family="Arial, serif" font-size="12pt" language="cs">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="vinylshop" page-height="297mm"
                    page-width="210mm" margin-top="20mm" margin-right="25mm" margin-bottom="20mm"
                    margin-left="25mm">
                    <fo:region-body/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after extent="0mm"/>
                    <fo:region-end extent="0mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!-- autor -->
            <fo:page-sequence master-reference="vinylshop">
                <fo:static-content flow-name="xsl-region-before" color="grey" font-size="10pt">
                    <fo:block-container margin-top="-10pt">
                        <!-- zahlavi-->
                        <fo:block text-align-last="right">
                            <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:jmeno"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:prijmeni"/>
                            <xsl:text> </xsl:text>
                        </fo:block>
                    </fo:block-container>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after" color="black" font-size="10pt">
                    <!-- zapati -->
                    <fo:block text-align="center">
                        <fo:page-number/>
                        <xsl:text> / </xsl:text>
                        <fo:page-number-citation ref-id="end"/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="32pt" font-weight="bold" text-align="center"
                        space-before="60pt" space-before.conditionality="retain" space-after="30px" id="seznam">
                        <xsl:text>Vinyl Shop</xsl:text>
                    </fo:block>

                    <fo:block text-align="center" space-before="35pt" space-after="35pt">
                        <fo:leader leader-length="0.8in" leader-pattern="rule"
                            alignment-baseline="middle" rule-thickness="0.7pt" color="black"/>
                    </fo:block>

                    <fo:block font-size="25pt" font-weight="bold" text-align="center"
                        space-before="50pt" space-before.conditionality="retain" space-after="20px">
                        <xsl:text>Autor: </xsl:text>
                        <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:jmeno"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:prijmeni"/>
                    </fo:block>

                    <fo:block font-size="14pt" space-after="20pt" text-align="center">
                        <xsl:text>Email: </xsl:text>
                        <xsl:apply-templates select="//fd:email"/>
                    </fo:block>

                    <!-- tabulka desek -->
                    <fo:block font-size="10pt" margin-top="35pt">
                        <fo:table width="155mm" border="1pt" border-style="solid"
                            background-color="#FFFFFF" display-align="center">
                            <fo:table-column column-width="40%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="10%"/>
                            <fo:table-header>
                                <fo:table-row border-style="solid" border-width="2pt"
                                    border-color="black" font-weight="bold" font-size="12pt"
                                    background-color="#930B0A" color="white" text-align="center">
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Název</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Umělci</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Vydavatel</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Rok</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <fo:table-body>
                                <xsl:for-each select="//fd:dilo">
                                    <xsl:call-template name="dila"/>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <!-- detail dila -->
                    <fo:block>
                        <xsl:apply-templates select="fd:vinyl_shop/fd:hudebni_dila"
                            mode="detail"/>
                    </fo:block>
                    <fo:block id="end"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- tabulka del -->
    <xsl:template name="dila">
        <fo:table-row>
            <fo:table-cell padding="4pt" font-weight="bold" border-style="solid">
                <xsl:apply-templates select="fd:nazev"/>
            </fo:table-cell>
            <fo:table-cell padding="4pt" border-style="solid" border-width="1pt">
                <xsl:apply-templates select="fd:umelci"/>
            </fo:table-cell>
            <fo:table-cell padding="4pt" border-style="solid" border-width="1pt">
                <xsl:apply-templates select="fd:vydavatel/fd:nazev"/>
            </fo:table-cell>
            <fo:table-cell padding="4pt" border-style="solid" border-width="1pt">
                <xsl:apply-templates select="fd:vydano/fd:rok"/>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="fd:nazev">
        <fo:block font-size="10pt" text-align="center">
            <fo:basic-link internal-destination="{generate-id(..)}" color="red">
                <xsl:apply-templates/>
            </fo:basic-link>
        </fo:block>
    </xsl:template>
    <xsl:template match="fd:umelci">
        <fo:block font-size="10pt" text-align="center">
            <xsl:for-each select="fd:umelec">
                <xsl:if test="position() > 1">, </xsl:if>
                <xsl:value-of select="."/>
            </xsl:for-each>
        </fo:block>
    </xsl:template>
    <xsl:template match="fd:vydavatel/fd:nazev">
        <fo:block font-size="10pt" text-align="center">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="fd:vydano/fd:rok">
        <fo:block font-size="10pt" text-align="center">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- detail dila -->
    <xsl:template match="fd:hudebni_dila">
        <xsl:apply-templates select="fd:dilo" mode="detail">
            <xsl:sort select="fd:nazev" data-type="text" lang="cs"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="fd:dilo" mode="detail">
        <fo:block page-break-before="always" keep-together="always" id="{generate-id(.)}" font-size="12pt">
             <fo:table>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
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
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:apply-templates select="fd:obrazek" mode="detail"/>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
           
            <xsl:apply-templates select="fd:obsah" mode="detail"/>
            <fo:basic-link internal-destination="seznam" color="red" margin-top="1em" >
                <fo:inline font="20pt">Zpět na seznam děl</fo:inline>
            </fo:basic-link>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:nazev" mode="detail">
        <fo:block font-size="26pt" text-align="left" margin-bottom="30px">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:vydavatel" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Vydavatel: </fo:inline>
            <xsl:value-of select="fd:nazev"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:vydano" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Rok: </fo:inline>
            <xsl:value-of select="fd:rok"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:vydavatel/fd:zeme" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Země: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:typ" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Typ: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="fd:format" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Formát: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="fd:stav" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Stav: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="fd:cena" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Cena: </fo:inline>
            <xsl:apply-templates/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@mena"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="fd:obrazek" mode="detail">
        <xsl:if test="@src">
            <fo:block text-align="right">
                <fo:external-graphic src="url('{@src}')"/>
            </fo:block>
        </xsl:if>
    </xsl:template>

    <xsl:template match="fd:umelci" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Umělec: </fo:inline>
            <xsl:for-each select="fd:umelec">
                <xsl:if test="position() > 1">, </xsl:if>
                <xsl:value-of select="."/>
            </xsl:for-each>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="fd:obsah" mode="detail" >
        <fo:inline font-weight="bold">Skladby:</fo:inline>
        <fo:table margin-left="0.5em" margin-top="0.25em"
            margin-bottom="0.25em">
            <fo:table-column column-width="10%"/>
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
            <xsl:for-each select="fd:vinyl">
                <xsl:for-each select="fd:strana">
                    <xsl:for-each select="fd:skladba">
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block margin-right="0.5em">
                                <xsl:value-of select="../fd:kod"/>
                                <xsl:value-of select="fd:cislo"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block margin-right="0.5em">
                                <xsl:value-of select="fd:nazev"/>
                                </fo:block>
                            </fo:table-cell>                       
                            <fo:table-cell>
                                <fo:block margin-right="0.5em">
                                <xsl:value-of select="format-number(floor(fd:delka div 60) mod 60, '0')"/>
                                <xsl:value-of select="format-number(fd:delka mod 60, ':00')"/>
                                </fo:block>
                            </fo:table-cell>   
                        </fo:table-row>                   
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
</xsl:stylesheet>