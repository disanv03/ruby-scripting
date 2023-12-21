# Validating an XML Document
# Problem:
# You want to check whether an XML document conforms to a certain schema or DTD

require 'rubygems'
require 'libxml'

include LibXML
# DTD -> Document Type Definiton, is a set of markup declarations that
# define a document type for an XML document.
dtd = XML::Dtd.new(%{<!ELEMENT rubycookbook (recipe+)>
        <!ELEMENT recipe (title?, problem, solution, discussion, seealso?)>
        <!ELEMENT title (#PCDATA)>
        <!ELEMENT problem (#PCDATA)>
        <!ELEMEMT solution (#PCDATA)>
        <!ELEMENT discussion (#PCDATA)>
        <!ELEMENT seealso (#PCDATA)>})

# Here's an XML document that looks like it conforms to the DTD
open('cookbook.xml', 'w') do |f|
  f.write %{<?xml version="1.0"?>
            <rubycookbook>
              <recipe>
                <title>A recipe</title>
                <problem>A Difficult/common problem</problem>
                <solution>A smart solution</solution>
                <discussion>A deep solution</discussion>
                <seealso>Pointers</seealso>
              </recipe>
            </rubycookbook>
  }
end

document = XML::Document.file('cookbook.xml')
if document.validate(dtd)
  puts 'The xml document is valid according to the DTD.'
else
  puts 'The xml document is not valid according to the DTD.'
end

schema_str = %{<?xml version="1.0"?>
  <xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <xsd:element name="recipe" type="recipeType"/>
    <xsd:element name="rubycookbook" type="rubycookbookType"/>
    <xsd:element name="title" type="xsd:string"/>
    <xsd:element name="problem" type="xsd:string"/>
    <xsd:element name="solution" type="xsd:string"/>
    <xsd:element name="discussion" type="xsd:string"/>
    <xsd:element name="seealso" type="xsd:string"/>
    <xsd:complexType name="rubycookbookType">
      <xsd:sequence>
        <xsd:element ref="recipe"/>
      </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="recipeType">
      <xsd:sequence>
        <xsd:element ref="title"/>
        <xsd:element ref="problem"/>
        <xsd:element ref="solution"/>
        <xsd:element ref="discussion"/>
        <xsd:element ref="seealso"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:schema>
}

schema = XML::Schema.from_string(schema_str)
