
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

data = ['1', '2', '3']
s = ''
data.each { |x| s << x << ' and a ' }
# => "1 and a 2 and a 3 and a "
data.join(' and a ')
# => "1 and a 2 and a 3"

# to simulate the behavior of Array#join we use Enumerable#each_with_index
s = ""
data.each_with_index { |x, i| s << x; s << "|" if i < data.length-1 }
# => "1|2|3"
