<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" >
    <pattern>
        <rule context="vinyl_shop">
            <assert test="autor">autor databaze</assert>
            <assert test="hudebni_dila">v katalogu musi byt alespon jedno hudebni dilo</assert>
        </rule>
    </pattern>
    <pattern>
        <title>AUTOR DATABAZE GRAMODESEK</title>
        <rule context="autor">
            <assert test="jmeno"></assert>
            <assert test="prijmeni"></assert>
            <assert test="email"></assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U DILA</title>
        <rule context="dilo">
            <assert test="nazev">Chybi tag: nazev</assert>
            <assert test="obrazek">Chybi tag: obrazek</assert>
            <assert test="umelci">Chybi tag: umelci</assert>
            <assert test="vydavatel">Chybi tag: vydavatel</assert>
            <assert test="vydano">Chybi tag: vydano</assert>
            <assert test="kod">Chybi tag: kod</assert>
            <assert test="typ">Chybi tag: typ</assert>
            <assert test="format">Chybi tag: format</assert>
            <assert test="zanry">Chybi tag: zanry</assert>
            <assert test="stav">Chybi tag: stav</assert>
            <assert test="cena">Chybi tag: cena</assert>
            <assert test="dostupnost">Chybi tag: dostupnost</assert>
            <assert test="obsah">Chybi tag: obsah</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U UMELCU</title>
        <rule context="umelci">
            <assert test="umelec">Chybi tag: umelec</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U VYDAVATELE</title>
        <rule context="vydavatel">
            <assert test="nazev">Chybi tag: nazev</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U VYDANO</title>
        <rule context="vydano">
            <assert test="rok">Chybi tag: rok</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U ZANRU</title>
        <rule context="zanry">
            <assert test="zanr">Chybi tag: zanr</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U OBSAHU</title>
        <rule context="obsah">
            <assert test="vinyl">Chybi tag: vinyl</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U VINYLU</title>
        <rule context="vinyl">
            <assert test="strana">Chybi tag: strana</assert>
            <assert test="strana">Chybi tag: strana</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U STRANY</title>
        <rule context="strana">
            <assert test="kod">Chybi tag: kod</assert>
            <assert test="skladba">Chybi tag: skladba</assert>
        </rule>
    </pattern>
    <pattern>
        <title>TAGY U SKLADEB</title>
        <rule context="skladba">
            <assert test="nazev">Chybi tag: nazev</assert>
            <assert test="delka">Chybi tag: delka</assert>
        </rule>
    </pattern>
    <pattern>
        <title>ATRIBUTY U CENY</title>
        <rule context="cena">
            <assert test="@mena">Chybi atribut: mena</assert>
        </rule>
    </pattern>
    <pattern>
        <title>ATRIBUTY U OBRAZKU</title>
        <rule context="obrazek">
            <assert test="@src">Chybi atribut: src</assert>
        </rule>
    </pattern>
    <pattern>
        <title>ATRIBUTY U DELKY</title>
        <rule context="delka">
            <assert test="@jednotka">Chybi atribut: jednotka</assert>
        </rule>
    </pattern>
</schema>
