# -*- coding: utf-8 -*-
#
# Attribute Mapping documentation build configuration file, created by
# sphinx-quickstart on Wed Sep 20 01:23:05 2017.
#
# This file is execfile()d with the current directory set to its
# containing dir.
#
# Note that not all possible configuration values are present in this
# autogenerated file.
#
# All configuration values have a default; values that are commented out
# serve to show the default.

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- General configuration ------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'


from java.io import FileReader
from org.apache.maven.model.io.xpp3 import MavenXpp3Reader

##
##  Read the pom file and store in model so we can retrieve the
##  version etc.
##
model = MavenXpp3Reader().read(FileReader("pom.xml"))

try:
    import sphinx_rtd_theme
except ImportError:
    sphinx_rtd_theme = None


# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.ifconfig',  'javasphinx',
              'sphinx.ext.todo',
              'sphinx.ext.extlinks',
              'sphinx.ext.githubpages']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = '.rst'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = u'Attribute Mapping Policy Reference'
copyright = u'2017, Rackspace'
author = u'Rackspace'

# Global variables that are replaced by the specified value during the build
# process.

rst_epilog = """

.. |service| replace:: Rackspace Identity Federation
.. |product name| replace:: Attribute Mapping Policy Reference

"""

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
if model.version:
    version = model.version
else:
    version = model.parent.version

# The full version, including alpha/beta/rc tags.
release = version

print "Building "+model.artifactId+" "+version

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This patterns also effect to html_static_path and html_extra_path
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = False


# -- Options for HTML output ----------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
if sphinx_rtd_theme:
    html_theme = 'sphinx_rtd_theme'
else:
    html_theme = 'alabaster'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
# html_theme_options = {}

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v1.0 documentation".
html_title = 'Attribute Mapping Policy Reference v'+version

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = 'Mapping Policy Reference  v'+version


# If true, SmartyPants will be used to convert quotes and dashes to
# typographically correct entities.
html_use_smartypants = True


# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_show_sourcelink = False

# -- Options for HTMLHelp output ------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = 'docs-rackspace-federation-mapping'

# this will change the 'paragraph' character to '#'
html_add_permalinks = '#'

# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    #
    # 'preamble': '',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, 'AttributeMapping.tex', u'Attribute Mapping Documentation',
     u'Rackspace', 'manual'),
]


# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (master_doc, 'attributemapping', u'Attribute Mapping Documentation',
     [author], 1)
]


# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, 'AttributeMapping', u'Attribute Mapping Documentation',
     author, 'AttributeMapping', 'One line description of project.',
     'Miscellaneous'),
]



