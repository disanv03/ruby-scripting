# Navigating a Document with XPath
# Problem:
# You want to find or address sections of an XML document in a standard,
# programming-language-independent way.

# The XPath language defines a way of referring to almost any element or
# set of elements in an XML document, and the REXML library comes with
# a complete XPath implementation.

xml = %{
<aquarium>
  <fish color="blue" size="small" />
  <fish color="orange" size="large" >
    <fish color="green" size="small">
      <fish color="red" size="tiny" />
    </fish>
  </fish>

  <decoration type="castle" style="gaudy">
    <algae color="green" />
  </decoration>
</aquarium>}

require 'rexml/document'
doc = REXML::Document.new xml

# We can use REXML::Xpath.first to get the element object corresponding
# to the first <fish> tag.
p REXML::XPath.first(doc, '//fish')
# => <fish size="small" color="blue" />

# We can use match to get an array containing all the elements that are green:
p REXML::XPath.match(doc, '//*[@color="green"]')

# '//' is used as a shorthand to search for a node anywhere in the XML doc
# '//' is a general searches by opposition of /root/child which is specific

# We can use each with a block to iterate over all the fish that are inside
# other fish:

def describe(fish)
  "#{fish.attribute('size')} #{fish.attribute('color')} fish"
end

REXML::XPath.each(doc, '//fish/fish') do |fish|
  puts "The #{describe(fish.parent)} has eaten the #{describe(fish)}."
end

# Every element in a Document has an xpath method that returns the canonical# XPath path to that element. This path can be considered the element's "address"
# within the document.
# In this example, a complex bit of Ruby code is replaced by a simple XPath expression:

#red_fish = doc.children[0].children[3].children[1].children[1]
#red_fish.xpath
#REXML::XPath.first(doc, red_fish.xpath)

# Find the second green element.
p REXML::XPath.match(doc, '//*[@color="green"]')[1]

# Find the color attributes of all small fish.
p REXML::XPath.match(doc, '//fish[@size="small"]/@color')

# Count how many fish are inside the first large fish.
p REXML::XPath.first(doc, "count(//fish[@size='large'][1]//*fish)")

doc.elements.each('//fish') { |f| puts f.attribute('color') }
p doc.elements['//fish']
p doc.elements[1]
# doc.children[0]
