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

            <!-- NADPIS + AUTOR -->
            <fo:page-sequence master-reference="vinylshop">
                <fo:static-content flow-name="xsl-region-before" color="grey" font-size="10pt">
                    <fo:block-container margin-top="-10pt">
                        <!-- ZAHLAVI-->
                        <fo:block text-align-last="right">
                            <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:jmeno"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:prijmeni"/>
                            <xsl:text> </xsl:text>
                        </fo:block>
                    </fo:block-container>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after" color="black" font-size="10pt">
                    <!-- ZAPATI -->
                    <fo:block text-align="center">
                        <fo:page-number/>
                        <xsl:text> / </xsl:text>
                        <fo:page-number-citation ref-id="end"/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="32pt" font-weight="bold" text-align="center"
                        space-before="50pt" space-before.conditionality="retain" space-after="20px">
                        <xsl:text>Vinyl Shop</xsl:text>
                    </fo:block>


                    <fo:block text-align="center" space-before="35pt" space-after="35pt">
                        <fo:leader leader-length="5in" leader-pattern="rule"
                            alignment-baseline="middle" rule-thickness="0.8pt" color="black"/>
                    </fo:block>

                    <fo:block font-size="25pt" font-weight="bold" text-align="center"
                        space-before="50pt" space-before.conditionality="retain" space-after="20px">
                        <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:jmeno"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="fd:vinyl_shop/fd:autor/fd:prijmeni"/>
                    </fo:block>

                    <fo:block font-size="14pt" space-after="10pt" text-align="center">
                        <xsl:apply-templates select="//fd:email"/>
                    </fo:block>


                    <!-- TABULKA FILMU -->
                    <fo:block font-size="10pt" margin-top="30pt">
                        <fo:table width="155mm" border="1pt" border-style="solid"
                            background-color="#F5E6F6" display-align="center">
                            <fo:table-column column-width="40%"/>
                            <fo:table-column column-width="20%"/>
                            <fo:table-column column-width="20%"/>
                            <fo:table-column column-width="20%"/>
                            <fo:table-header>
                                <fo:table-row border-style="solid" border-width="2pt"
                                    border-color="black" font-weight="bold" font-size="12pt"
                                    background-color="#000000" color="white" text-align="center">
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Název</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Rok natočení</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Režie</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="2pt" border-style="solid"
                                        border-color="black">
                                        <fo:block>Hodnocení</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <fo:table-body>
                                <xsl:for-each select="//fd:dilo">
                                    <!-- <xsl:sort select="//fd:film/fd:nazev_cesky"/> -->
                                    <xsl:call-template name="dila"/>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <!-- DETAIL FILMU -->
                    <fo:block>
                        <xsl:apply-templates select="fd:vinyl_shop/fd:hudebni_dila"
                            mode="detail"/>
                    </fo:block>
                    <fo:block id="end"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- TABULKA FILMU - TEMPLATE -->
    <xsl:template name="dila">
        <fo:table-row>
            <fo:table-cell padding="4pt" font-weight="bold" border-style="solid">
                <xsl:apply-templates select="fd:nazev"/>
            </fo:table-cell>
            <fo:table-cell padding="4pt" border-style="solid" border-width="1pt">
                <xsl:apply-templates select="fd:rok"/>
            </fo:table-cell>
            <fo:table-cell padding="4pt" border-style="solid" border-width="1pt">
                <xsl:apply-templates select="fd:typ"/>
            </fo:table-cell>
            <fo:table-cell padding="4pt" border-style="solid" border-width="1pt">
                <xsl:apply-templates select="fd:stav"/>
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
    <xsl:template match="fd:rok">
        <fo:block font-size="10pt" text-align="center">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="fd:typ">
        <fo:block font-size="10pt" text-align="center">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="fd:stav">
        <fo:block font-size="10pt" text-align="center">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- DETAIL FILMU -->
    <xsl:template match="fd:hudebni_dila">
        <xsl:apply-templates select="fd:film" mode="detail">
            <xsl:sort select="fd:nazev" data-type="text" lang="cs"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="fd:dilo" mode="detail">
        <fo:block keep-together="always" id="{generate-id(.)}" font-size="12pt">
            <xsl:apply-templates select="fd:nazev" mode="detail"/>

            <fo:table>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <xsl:apply-templates select="fd:nazev" mode="detail"/>
                            <xsl:apply-templates select="fd:rok" mode="detail"/>
                            <xsl:apply-templates select="fd:typ" mode="detail"/>
                            <xsl:apply-templates select="fd:stav" mode="detail"/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:apply-templates select="fd:obrazek" mode="detail"/>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
            <fo:inline font-weight="bold">Produkce:</fo:inline>
             <xsl:apply-templates select="fd:umelci" mode="detail"/>
            
            <xsl:apply-templates select="fd:obsah" mode="detail"/>
            <fo:basic-link internal-destination="nadpis" color="red" margin-top="1em" >
                <fo:inline font="20pt">Zpět na seznam děl</fo:inline>
            </fo:basic-link>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:nazev" mode="detail">
        <fo:block font-size="32pt" text-align="center" margin-bottom="30px">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:rok" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Rok: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:typ" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Typ: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:stav" mode="detail">
        <fo:block font-size="12pt" text-align="left">
            <fo:inline font-weight="bold">Stav: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="fd:obrazek" mode="detail">
        <xsl:if test="@src">
            <fo:block text-align="right">
                <fo:external-graphic src="url('images\{@src}')"/>
            </fo:block>


        </xsl:if>
        <xsl:if test="not(@src)">
            <fo:block margin-bottom="5pt">
                <fo:inline font-weight="bold">Obal: </fo:inline>
                
            </fo:block>
        </xsl:if>
    </xsl:template>

    <xsl:template match="fd:umelci/*" mode="detail">
        
        <fo:table margin-left="0.5em" margin-top="0.25em"
            margin-bottom="0.25em">
            <fo:table-body>
                
                <fo:table-row>
                    <fo:table-cell width="5em">
                        <fo:block margin-right="1.5em">
                            <xsl:value-of select ="name(.)"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell width="5em">
                        <fo:block margin-right="0.5em">
                            <xsl:apply-templates/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
        
    </xsl:template>

    <!-- ODSTAVEC -->
    <xsl:attribute-set name="p">
        <xsl:attribute name="text-indent">1em</xsl:attribute>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:template match="fd:obsah" mode="detail" >
        <fo:inline font-weight="bold">Obsah:</fo:inline>
        <fo:block xsl:use-attribute-sets="p"><fo:inline><xsl:apply-templates></xsl:apply-templates></fo:inline></fo:block>
        
    </xsl:template>
</xsl:stylesheet>