<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    <p:input port="source"/>
    <p:output port="result"/>
    <p:import href="recursive-dir-list.xpl"/>
    <cx:recursive-directory-list path="../site/sphinx" include-filter="^.*\.rst$"/>
    <p:identity/>
</p:declare-step>
