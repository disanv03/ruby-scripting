# Creating and Modifiying XML Documents
# Problem:
# You want to modify an XML document, or create a new one from scratch

require 'rexml/document'

doc = REXML::Document.new
meeting = doc.add_element 'meeting'
meeting_start = Time.local(2006, 10, 31, 13)
meeting.add_element('time', { 'from' => meeting_start,
                              'to' => meeting_start + 3600 } )
p doc.children[0]
p doc.children[0].children[0]
p doc.write($stdout, 1)
p doc.children[0]
p doc.children[1]

agenda = meeting.add_element 'agenda'
p doc.children[1].children[1]
agenda.add_text "Nothing of importance will be decided."
agenda.add_text " The same tired ideas will be rehashed yet again."

p doc.children[1].children[1]

doc.write($stdout, 1)

item1 = agenda.add_element 'item'
p doc.children[1].children[1].children[1]
item1.text = 'Weekly status meetings: improving attendance'
p doc.children[1].children[1].children[1]
p doc.write($stdout, 1)



xml_str = %{<?xml version='1.0'?>
    <girl size="little">
     <foods>
      <sugar />
      <spice />
     </foods>
     <set of="nice things" cardinality="all" />
    </girl>
}

# Parse the existing document
doc = REXML::Document.new(xml_str)
old_root = doc.root

# Create a new document with a new root element
new_doc = REXML::Document.new
new_root = new_doc.add_element('boy')

# Copy attributes from old root to new root
old_root.attributes.each_attribute { |attr| new_root.add_attribute(attr.name, attr.value) }

# Copy children from old root to new root
old_root.each_element { |element| new_root.add_element(element.deep_clone) }

# Modify elements
new_root.elements['//sugar'].name = 'snails'
new_root.delete_element('//spice')

set = new_root.elements['//set']
set.attributes["of"] = "snips"
set.attributes["cardinality"] = 'some'

# Add new element
new_root.add_element('set', {'of' => 'puppy dog tails', 'cardinality' => 'some'})

# Replace 'snails' element with 'escargot'
new_root.elements["//snails"].replace_with(REXML::Element.new("escargot"))

# Output the modified XML
new_doc.write($stdout, 2)

doc = REXML::Document.new

# Create the 'girl' element and add it to the document
girl = doc.add_element('girl', {'size' => 'little'})

# Create the 'foods' element and add it to 'girl'
foods = girl.add_element('foods')

# Add 'sugar' and 'spice' elements to 'foods'
foods.add_element('sugar')
foods.add_element('spice')

# Add 'set' element to 'girl'
girl.add_element('set', {'of' => 'nice things', 'cardinality' => 'all'})

# Output the XML
doc.write($stdout, 2)
