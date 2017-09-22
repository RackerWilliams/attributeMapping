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

   +--------+---------------------------+
   | domain | 32367                     |
   +--------+---------------------------+
   | name   | joe.doe                   |
   +--------+---------------------------+
   | email  | no-reply@rackspace.com    |
   +--------+---------------------------+
   | roles  | nova:admin                |
   +--------+---------------------------+
   | expire | 2013-11-17T16:19:06.298Z  |
   +--------+---------------------------+

.. highlight:: yaml
   :linenothreshold: 5

.. literalinclude::
   ./../../../../core/src/test/resources/tests/mapping-tests/defaults/maps/defaults.yaml
   :linenos:
   :caption: Default Policy

.. sidebar:: Resulting Attributes 2

   +--------+---------------------------+
   | domain | 32367                     |
   +--------+---------------------------+
   | name   | joe.doe                   |
   +--------+---------------------------+
   | email  | no-reply@rackspace.com    |
   +--------+---------------------------+
   | roles  | nova:admin                |
   +--------+---------------------------+
   | expire | 2013-11-17T16:19:06.298Z  |
   +--------+---------------------------+

.. literalinclude::
   ./../../../../core/src/test/resources/tests/mapping-tests/defaults/maps/defaults.yaml
   :linenos:
   :caption: Default Policy

.. empty:: Empty directive with arg


.. empty2:: Empty directive with args

    And some content. There as well as you can plainly see. There is
    lots of conteent enougth that it can fill several lines worth of
    text.

    In fact there are several paragraphs here.

.. empty3::

   Just content please.

.. empty4::  Here we have a super long
   argument... it goes into the next line

   But there is still body content.
