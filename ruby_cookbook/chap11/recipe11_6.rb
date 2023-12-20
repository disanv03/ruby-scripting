# Converting an XML Document into a Hash
# Problem:
# When you parse an XML document with Document.new, you get a representation
# of the document as a complex data structure. You'd like to represent an
# XML document using simple, built-in Ruby data structures.

xml = %{
  <freezer temp="-12" scale="celcius">
    <food>Phyllo dough</food>
    <food>Ice cream</food>
    <icecubetray>
      <cube1 />
      <cube2 />
    </icecubetray>
  </freezer>}

require 'rubygems'
require 'xmlsimple'

doc = XmlSimple.xml_in xml

require 'pp'
pp doc

xml = %{
	<freezer temp="-12" scale="celcius">
	 <item name="Phyllo dough" type="food" />
	 <item name="Ice cream" type="food" />
	 <item name="Ice cube tray" type="container">
	  <item name="Ice cube" type="food" />
	  <item name="Ice cube" type="food" />
	 </item>
	</freezer>}

parsed1 = XmlSimple.xml_in xml
pp parsed1

parsed2 = XmlSimple.xml_in(xml, 'KeyAttr' => 'name')
pp parsed2

p parsed1["item"].detect { |i| i['name'] == "Phyllo dough" }['type']
p parsed2["item"]["Phyllo dough"]["type"]

parsed1["item"] << {"name"=>"Curry leaves", "type"=>"spice"}
parsed1["item"].delete_if { |i| i["name"] == "Ice cube tray" }

puts XmlSimple.xml_out(parsed1, "RootName"=>"freezer")

parsed3 = XmlSimple.xml_in(xml, 'KeepRoot'=>true)
# Now there's no need to add an extra root element when writing back to XML.
XmlSimple.xml_out(parsed3, 'RootName'=>nil)

pp XmlSimple.xml_in(%{
	<freezer temp="-12" scale="celcius">
	 <temp>Body of temporary worker who knew too much</temp>
	</freezer>})


