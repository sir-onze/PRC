<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="text" indent="yes"/>
    
   
    <xsl:template match="results">
        <xsl:for-each select="result">
            ###  http://www.di.uminho.pt/prc2020/cinema#<xsl:value-of select="translate(binding[@name='fname'],' …’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.–','_')"/>
            :<xsl:value-of select="translate(binding[@name='fname'],' …’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.–','_')"/> rdf:type owl:NamedIndividual ,
                    :Filme ;
                    :temLíngua :<xsl:value-of select="binding[@name='lang']"/> ;
                    :temPaísOrigem :<xsl:value-of select="translate(binding[@name='country'],' ','_')"/> ;
                    :título "<xsl:value-of select="binding[@name='fname']"/>"^^xsd:string .
        </xsl:for-each>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="result">
        <xsl:variable name="film" select="translate(binding[@name='fname'],' …’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.–','_')"/>
        <items>
            <xsl:for-each select="tokenize(binding[@name='actors'],',')">
                <item>
                    ###  http://www.di.uminho.pt/prc2020/cinema#<xsl:value-of select="translate(normalize-space(.),' ’’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.','_')"/>
                    :<xsl:value-of select="translate(normalize-space(.),' ’’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.','_')"/> rdf:type owl:NamedIndividual ,
                    :Pessoa ;
                    :atuou :<xsl:value-of select="$film"/> .
                </item>
            </xsl:for-each>
        </items>
        
        ###  http://www.di.uminho.pt/prc2020/cinema#<xsl:value-of select="translate(binding[@name='dirname'],' ’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.','_')"/>
        :<xsl:value-of select="translate(binding[@name='dirname'],' ’&#161;&#36;&#189;&#176;&#91;&#93;&#191;&#43;&#34;&#47;&#38;&#58;&#44;&#40;&#41;&#45;&#63;&#59;&#33;&#42;×.','_')"/> rdf:type owl:NamedIndividual ,
        :Pessoa ;
        :realizou :<xsl:value-of select="$film"/> .
        
        ###  http://www.di.uminho.pt/prc2020/cinema#<xsl:value-of select="binding[@name='country']"/>
        :<xsl:value-of select="binding[@name='country']"/> rdf:type owl:NamedIndividual ,
        :País .
        
        
        ###  http://www.di.uminho.pt/prc2020/cinema#<xsl:value-of select="binding[@name='lang']"/>
        :<xsl:value-of select="binding[@name='lang']"/> rdf:type owl:NamedIndividual ,
        :Língua .
        

    </xsl:template>
    
</xsl:stylesheet>