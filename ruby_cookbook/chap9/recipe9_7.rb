# Including Namespaces
# Problem:
# You want to use the objects within a module without constantly
# qualifying the object names with the name of their module

# Instead of this:
require 'rexml/document'
REXML::Document.new(xml)

require 'rexml/document'
include REXML
Document.new(xml)

#
#

require 'rexml/parsers/pullparser'
REXML::Parsers::PullParser.new("Some XML")

require 'rexml/parsers/pullparser'
include REXML::Parsers
PullParser.new("Some Xml")
