<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rstd="http://www.rackspace.com/docs/rstd"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output  indent="no"></xsl:output>

    <xsl:variable name="pathToMappingTests">../../../../../core/src/test/resources/tests/mapping-tests/</xsl:variable>
    
    <!-- Copy Everything -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="rstd:directive[lower-case(@type)='attribmap']">
        <xsl:variable name="testCase" as="xs:string?" select="normalize-space(rstd:content[1])"/>
        <xsl:variable name="showSAMLField" as="node()?" select="rstd:field[lower-case(@name)='saml-show']"/>
        <xsl:variable name="showSAML" as="xs:boolean" select="empty($showSAMLField) or xs:boolean(string($showSAMLField))"/>
        <xsl:if test="$testCase = ''">
            <xsl:call-template name="rstd:directive-fail">
                <xsl:with-param name="msg">Missing test case name.</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="empty(rstd:field[lower-case(@name)='saml'])">
            <xsl:call-template name="rstd:directive-fail">
                <xsl:with-param name="msg">Missing required saml field.</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="empty(rstd:field[lower-case(@name)='map'])">
            <xsl:call-template name="rstd:directive-fail">
                <xsl:with-param name="msg">Missing required map field.</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$showSAML">
            <xsl:call-template name="rstd:outputSample">
                <xsl:with-param name="sample" select="concat(' ',$pathToMappingTests,$testCase,'/asserts/',rstd:field[@name='saml'])"/>
                <xsl:with-param name="type">saml</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="rstd:directive-fail">
        <xsl:param name="msg" as="xs:string"/>
        <xsl:message terminate="yes">Error in <xsl:value-of select="@type"/> directive. <xsl:value-of
        select="concat($msg,' ',@source,':',@line)"/></xsl:message>
    </xsl:template>
    
    <xsl:template name="rstd:outputSample">
        <xsl:param name="sample" as="xs:string"/>
        <xsl:param name="type" as="xs:string"/>
        <xsl:param name="format" as="xs:string">
            <xsl:choose>
                <xsl:when test="ends-with($sample, '.xml')">xml</xsl:when>
                <xsl:when test="ends-with($sample, '.yaml')">yaml</xsl:when>
                <xsl:when test="ends-with($sample, '.json')">json</xsl:when>
                <xsl:otherwise>
                    <xsl:message>[WARNING] Could not determine sample format. Assuming xml!</xsl:message>
                    <xsl:value-of select="xml"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <rstd:directive type="highlight">
            <rstd:content> <xsl:value-of select="$format"/></rstd:content>
            <rstd:field name="linenothreshold">5</rstd:field>
        </rstd:directive>
        <rstd:directive type="literalinclude">
            <rstd:content> <xsl:value-of select="$sample"/></rstd:content>
            <rstd:field name="linenos" />
            <xsl:if test="rstd:field[lower-case(@name)=concat($type,'-caption')]">
                <rstd:field name="caption"><xsl:value-of select="rstd:field[lower-case(@name)=concat($type,'-caption')]"/></rstd:field>
            </xsl:if>
            <xsl:if test="rstd:field[lower-case(@name)=concat($type,'-emphasize-lines')]">
                <rstd:field name="emphasize-lines"><xsl:value-of select="rstd:field[lower-case(@name)=concat($type,'-emphasize-lines')]"/></rstd:field>
            </xsl:if>
        </rstd:directive>
    </xsl:template>
</xsl:stylesheet>
