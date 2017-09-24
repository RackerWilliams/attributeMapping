==========================
Attribute Mapping Policies
==========================


Attribute mapping policies allow you to integrate with Rackspace
identity federation feature without making significant changes to your
identity service provider.


SAML Example
------------

The following is example SAML:

.. attribmap:: defaults
   :saml: sample_assert.xml
   :saml-emphasize-lines: 26, 36, 40, 44
   :saml-caption: Default Assertion
   :map: defaults.yaml
   :map-caption: Default Mapping Policy


.. attribmap:: defaults2
   :saml: sample_assert.xml
   :saml-show: false
   :map: defaults2.yaml
   :map-caption: The mapping policy derives the email by name

Another important thing to note is that, bla, bla, bla...



