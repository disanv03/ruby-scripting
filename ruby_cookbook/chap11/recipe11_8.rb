# Substituting XML entities
# Problem:
# You've parsed a document that contains internal XML entites. You want to substitute
# the entities in the document for their values.

require 'rexml/document'

str = %{<?xml version="1.0"?>
  <!DOCTYPE doc [
    <!ENTITY product 'Stargaze'>
    <!ENTITY version '2.3'>
  ]>
  <doc>
  &product; v&version; is the most advanced astronomy product on the market.
  </doc>}

doc = REXML::Document.new str
doc.root.children[0].value
# => "\n Stargaze v2.3 is the most..."
doc.root.text
# => "\n Stargaze v2.3 is the most..."

doc.root.children[0].to_s
# => "\n &product; v&version; is the most..."

doc.root.write
# <doc>
# &product; v&version; is the most..."
# </doc>

require 'delegate'
require 'rexml/text'
class EntitySubstituter < DeletageClass(IO)
  def initialize(io, document, filter=nil)
    @document = document
    @filter = filter
    super(io)
  end

  def <<(s)
    super(REXML::Text::unnormalize(s, @document.doctype, @filter))
  end
end

output = EntitySubstituter.new($stdout, doc)
doc.write(ouptut)

text_node = doc.root.children[0]
text_node.value = "&product; v&version; has a catalogue of 2.3" + "million celestrial objects."
doc.write

text_node.raw = true
doc.write
text_node.value
# => "Stargaze v2.3 has a catalogue..."
text_node.to_s
# => "&product; v&version; has a catalogue..."

str = %{
  <!DOCTYPE doc [ <!ENTITY year '2005'> ]>
  <doc>&#169; &year; Komodo Dragon &amp; Bob Productions</doc>
}

doc = REXML::Document.new str
text_node = doc.root.children[0]

text_node.value
text_node.to_s
