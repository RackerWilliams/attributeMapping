.. See index.rst for info on attribmap, saml, and map directives.

============
Introduction
============

Attribute mapping policies allow you to integrate with Rackspace
identity federation without having to make significant configuration
changes to your identity provider. An attribute mapping policy
provides a declarative means of extracting and transforming
information produced by your identity system so that it may seamlessly
inter-operate with Rackspace.

This document describes the attribute mapping policy language in
detail. It is intended as a guide to assist in the writting of mapping
policies as well as a reference for the features of the policy
language.

Technology Background
---------------------

In order to write attribute mapping policies you should have
a basic understanding of the following technologies:

SAML 2.0
   The Security Assertion Markup Language is an OASIS Standard for
   defining XML-encoded assertions about authentication,
   authorization, and related attributes. A basic understanding of the
   SAML protocol is required, although this document concentrates
   soely on SAML Responses and SAML Assertions.

XPath 3.1
   XPath is a W3C standard expression language for extracting
   information from structured data (XML and JSON). The language is
   desgined to be embeded in a host language and it is used in this
   way by the mapping policy language. The datatypes and function
   libraries defined by the XPath standard are used in other policy
   languages such as XACML. In most cases, only basic understanding of
   XPath is required, see the XPath Basics appendix for a quick
   overview.

YAML 1.1
   YAML is a simple data serialization language that is designed to be
   human friendly.  YAML is very similar to JSON but allows for useful
   features such as comments and the ability to easily input
   multi-line data. Attribute mapping policies are written in YAML,
   see the YAML Basics appendix for a quick overview.


What is Attribute Mapping?
--------------------------

Your identity provider contains information about you.


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


