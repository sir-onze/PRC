<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="obra">
        ###  http://www.semanticweb.org/macz/ontologies/2020/arquivoMusica#<xsl:value-of select="@id"/>
        :<xsl:value-of select="@id"/> rdf:type owl:NamedIndividual ,
        :Obra ;
        <xsl:for-each select="instrumentos/instrumento">
        :instrumento "<xsl:value-of select="designacao"/>"^^xsd:string ;
        :temAssociado :<xsl:value-of select="partitura/@path"/> ;
        </xsl:for-each>
        :compositor "<xsl:value-of select="compositor"/>"^^xsd:string ;
        :tipo "<xsl:value-of select="tipo"/>"^^xsd:string ;
        :titulo "<xsl:value-of select="titulo"/>"^^xsd:string .
   
        <xsl:for-each select="instrumentos/instrumento">
            ###  http://www.semanticweb.org/macz/ontologies/2020/arquivoMusica#<xsl:value-of select="partitura/@path"/>
            :<xsl:value-of select="partitura/@path"/> rdf:type owl:NamedIndividual ,
            :Partitura;
            :EstaAssociadaA :<xsl:value-of select="../../@id"/> ;
            :tipo "<xsl:value-of select="partitura/@type"/>" .
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>