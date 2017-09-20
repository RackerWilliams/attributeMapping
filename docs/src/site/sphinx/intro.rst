==========================
Attribute Mapping Policies
==========================


Attribute mapping policies allow you to integrate with Rackspace
identity federation feature without making significant changes to your
identity service provider.


SAML Example
------------

The following is example SAML:

.. highlight:: xml
   :linenothreshold: 5


.. literalinclude::
   ./../../../../core/src/test/resources/tests/mapping-tests/defaults/asserts/sample_assert.xml
   :linenos:
   :emphasize-lines: 26, 36, 40, 44
   :caption: Default Assertion

.. sidebar:: Resulting Attributes

   ======  ========================
   domain  323676
   name    john.doe
   email   no-reply@rackspace.com
   roles   nova:admin
   expire  2013-11-17T16:19:06.298Z
   ======  ========================

.. highlight:: yaml
   :linenothreshold: 5

.. literalinclude::
   ./../../../../core/src/test/resources/tests/mapping-tests/defaults/maps/defaults.yaml
   :linenos:
   :caption: Default Policy

.. sidebar:: Resulting Attributes 2

   ======  ========================
   domain  323676
   name    john.doe
   email   no-reply@rackspace.com
   roles   nova:admin
   expire  2013-11-17T16:19:06.298Z
   ======  ========================

.. literalinclude::
   ./../../../../core/src/test/resources/tests/mapping-tests/defaults/maps/defaults.yaml
   :linenos:
   :caption: Default Policy
