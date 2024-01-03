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


