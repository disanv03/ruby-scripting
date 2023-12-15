# Checking XML well-formedness
# Problem:
# You want to check that an XML document is well-formed before processing it

require 'rexml/document'
def valid_xml?(xml)
  begin
    REXML::Document.new(xml)
  rescue REXML::ParseException
    # Return nil if an exception is thrown
  end
end

bad_xml = %{
<tasks>
  <pending>
    <entry>Grocery Shopping</entry>
    <done>
      <entry>Dry cleaning</entry>
</tasks>}

p valid_xml?(bad_xml)

good_xml = %{
<groceries>
  <bread>Wheat</bread>
  <bread>Quadrotriticale</bread>
</groceries>}

doc = valid_xml?(good_xml)
p doc.root.elements[1]

doc = nil
# assert_nothing_thrown {doc = REXML::Document.new(source_xml)}

invalid_xml = %{
<groceries>
  <bread>Wheat
}

p (valid_xml? invalid_xml) == nil
#REXML::Document.new(invalid_xml).write
