# Searching a hash with regular expressions
# Problem:
# You want to grep a hash: that is, find all keys and/or values in the hash
# that match a regular expressions

# The fast way to grep the keys of a hash is to get the keys as an array, 
# and grep that:

h = { "apple tree" => "plant", "ficus" => "plant", "shrew" => "animal",
      "plesiosaur" => "animal" }
p h.keys.grep /p/

# Having the key/value of grep on a value search
p h.inject([]) {|res, kv| res << kv if kv[1] =~ /p/; res}

# iterating over each key
res = []
h.each_key {|k| res << k if k =~ /p/}
p res
