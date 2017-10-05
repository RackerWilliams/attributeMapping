
.. table:: Attributes mapped to XPaths

   +-----------+----------------------------------------------------------------------------------------------------------------------+
   | Attribute | SAML Assertion Location (XPath)                                                                                      |
   +===========+======================================================================================================================+
   | Domain    | /saml2p:Response/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='domain']/saml2:AttributeValue[1]    |
   +-----------+----------------------------------------------------------------------------------------------------------------------+
   | Name      | /saml2p:Response/saml2:Assertion/saml2:Subject/saml2:NameID                                                          |
   +-----------+----------------------------------------------------------------------------------------------------------------------+
   | Email     | /saml2p:Response/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='email']/saml2:AttributeValue[1]     |
   +-----------+----------------------------------------------------------------------------------------------------------------------+
   | Roles     | /saml2p:Response/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='roles']/saml2:AttributeValue        |
   +-----------+----------------------------------------------------------------------------------------------------------------------+
   | Expire    | /saml2p:Response/saml2:Assertion/saml2:Subject/saml2:SubjectConfirmation/saml2:SubjectConfirmationData/@NotOnOrAfter |
   +-----------+----------------------------------------------------------------------------------------------------------------------+
