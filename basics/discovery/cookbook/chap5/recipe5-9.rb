# Printing a Hash
# Problem:
# You want to print out the contents of a hash, but Kernel#puts doesn't give very useful results.

h = {}
h[:name] = "Robert"
h[:nickname] = "Bob"
h[:age] = 43
h[:email_addresses] = { :home => "bob@example.com", :work => "robert@example.com"}

puts h
puts h[:email_addresses]

# When the hash you're trying to print is too large, the pp ("pretty-print") module
# produces very readable results:

require 'pp'
pp h[:email_addresses]
pp h

PP::pp(h, $stderr, 50)

require 'yaml'
puts h.to_yaml

h[:email_addresses].each_pair do |key, val|
  puts "#{key} => #{val}"
end
