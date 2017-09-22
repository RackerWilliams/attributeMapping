<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY CR "&#x0A;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output  indent="no"></xsl:output>
    <!-- Copy Everything -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!--
    <system_message level="3" line="43" source="/Users/jorgew/projects/attributeMapping/docs/src/site/sphinx/intro.rst" type="ERROR"><paragraph>Unknown directive type "literalinclude".</paragraph><literal_block xml:space="preserve">.. literalinclude::
   ./../../../../core/src/test/resources/tests/mapping-tests/defaults/maps/defaults.yaml
   :linenos:
   :caption: Default Policy
</literal_block></system_message>
    -->
    <!-- Capture an directive system message and
         turn it into a directive -->
    <xsl:template match="system_message[@level=3 and @type='ERROR' and contains(paragraph,'Unknown directive')]">
        <xsl:variable name="directiveText" select="literal_block" as="xs:string"/>
        <directive>
            <xsl:call-template name="parseDirective">
                <xsl:with-param name="directiveText" select="$directiveText"/>
            </xsl:call-template>
            <raw xml:space="preserve"><xsl:value-of select="$directiveText"/></raw>
        </directive>
    </xsl:template>
    
    <xsl:template name="parseDirective">
        <xsl:param name="directiveText" as="xs:string"/>
        <xsl:analyze-string select="$directiveText" regex="^\.\.\s(([A-Z]|[a-z]|[0-9]|-|_)*)::\s(.*)$" flags="s">
            <xsl:matching-substring>
                <xsl:attribute name="type" select="regex-group(1)"/>
                <xsl:call-template name="parseDirectiveArgs">
                    <xsl:with-param name="argText" select="regex-group(3)"/>
                </xsl:call-template>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:attribute name="type">UNKNOWN</xsl:attribute>
                <xsl:message>[WARNING] Unable to parse directive: <xsl:value-of select="$directiveText"/></xsl:message>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <xsl:template name="parseDirectiveArgs">
        <xsl:param name="argText" as="xs:string"/>
        <xsl:choose>
            <!-- Has fields -->
            <xsl:when test="matches($argText,'^\s*:([A-Z]|[a-z]|[0-9]|-|_)*:.*$','m')">
                <hasFields/>
            </xsl:when>
            <xsl:otherwise>
                <args><xsl:call-template name="matchFirst">
                    <xsl:with-param name="in" select="$argText"/>
                    <xsl:with-param name="match" select="'\s+\n'"/>
                    <xsl:with-param name="separator" select="'(&CR;&CR;)'"></xsl:with-param>
                </xsl:call-template></args>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="matchFirst">
        <xsl:param name="in" as="xs:string"/>
        <xsl:param name="match" as="xs:string"/>
        <xsl:param name="separator" as="xs:string"/>
        <xsl:variable name="regex" as="xs:string" select="concat('^(.*)(',$match,')?')"/>
        <matchFirst>
        <xsl:analyze-string select="$in" regex="$regex">
            <xsl:matching-substring>
                <match><xsl:value-of select="."/></match>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <notMatch><xsl:value-of select="."/></notMatch>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
        </matchFirst>
    </xsl:template>
</xsl:stylesheet>