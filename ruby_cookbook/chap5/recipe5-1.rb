# Using Symbols as Hash Keys
# Problem:
# When using a hash, you want to slight optimization you can get by using
# symbols as keys instead of strings.

people = Hash.new
people[:nickname] = 'Matz'
people[:language] = 'Japanese'
people['last name'.intern] = 'Matsumoto'
p people[:nickname]
p people['nickname'.intern]


p 'name'.object_id
p 'name'.object_id
p 'name'.object_id

p :name.object_id
p :name.object_id
p 'name'.intern.object_id
p 'name'.intern.object_id

# Using symbols of strings saves memory and time. It saves memory because there's only one symbol instance,
# instead of many string instances. If you have many hashes that contain the same keys, the memory savings adds up.
# Using symbols as hash keys is faster because the hash value of a symbol is simply its object ID. If you
# use strings in a hash, Ruby must calculate the hash value of a string each time it's used as a hash key.
