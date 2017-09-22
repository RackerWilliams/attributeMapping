<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    <p:output port="result" sequence="false"/>
    <p:import href="recursive-dir-list.xpl"/>
    <cx:recursive-directory-list path="../site/sphinx" include-filter="^.*\.rst$"/>
    <p:for-each>
        <p:iteration-source select="//c:directory"/>
        <p:variable name="base" select="substring-after(/c:directory/@xml:base,'file:')"/>
        <p:for-each>
            <p:iteration-source select="//c:file"/>
            <p:variable name="fullName" select="concat($base,/c:file/@name)"/>
            <p:exec command="rst2xml-2.7.py" result-is-xml="true" source-is-xml="false" arg-separator=",">
                <p:input port="source"><p:empty/></p:input>
                <p:with-option name="args" select="concat('--no-doctype,',$fullName)"/>
            </p:exec>
            <p:filter select="c:result/element()"/>
            <p:xslt version="2.0">
                <p:input port="stylesheet">
                    <p:document href="../xsl/xml2rst-wrapper.xsl"/>
                </p:input>
                <p:input port="parameters">
                    <p:empty/>
                </p:input>
            </p:xslt>
        </p:for-each>
    </p:for-each>
    <p:wrap-sequence wrapper="c:result"/>
    <p:identity/>
</p:declare-step>
