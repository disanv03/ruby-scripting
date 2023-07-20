# Building a String from Parts
hash = { "key1" => "val1", "key2" => "val2" }
string = ""
hash.each { |k,v| string << "#{k} is #{v}\n" }
puts string

# variant of the simple solution (harder to read)
hash.each { |k,v| string << k << " is " << v << "\n" }

# print keys
puts hash.keys.join("\n")
# => key1
# => key2
