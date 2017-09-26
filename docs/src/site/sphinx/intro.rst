==========================
Attribute Mapping Policies
==========================


Attribute mapping policies allow you to integrate with Rackspace
identity federation feature without making significant changes to your
identity service provider.


Default Example
---------------

The following is example SAML:

.. saml:: defaults/sample_assert.xml
   :emphasize-lines: 17, 19, 29, 32, 35
   :caption: Default Assertion

With that you can use a default mapping policy that looks like this:

.. map:: defaults/defaults.yaml
   :caption: Default Mapping Policy
   :emphasize-lines: 3-7

Extended Example
----------------

Here's an example of complex extended attribute map

.. attribmap:: adfs-faws-ext2
   :map: faws-s.yaml
   :saml: sample_assert.xml


