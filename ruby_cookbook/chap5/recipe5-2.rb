# Creating a Hash with a Default value
# Problem
# You'r using a hash, and you don't want to get 'nil' as a value when you look up a key that isn't present
# in the hash. You want to get some more convenient value instead, possibly one calculated dynamically.

# Normal hash has a default value of nil
h = Hash.new
p h[1]
p h['do you have this string?']

h = Hash.new("nope")
p h[1]
p h['do you have this string?']

# Custom behavior when accesing nonexistant keys.

h = Hash.new { |_, key| (key.respond_to? :to_str) ? "nope" : nil }
p h[1]
p h['do you have this string?']

text = 'The rain in Spain falls mainly in the plain.'
word_count_hash = Hash.new(0)
text.split(/\W+/).each { |word| word_count_hash[word.downcase] += 1 }
p word_count_hash

first_letter_hash = Hash.new []
text.split(/\W+/).each { |word| first_letter_hash[word[0,1].downcase] << word }
p first_letter_hash
p first_letter_hash["m"]
# What's going on here ? All those words don't start with "m"...

first_letter_hash = Hash.new { |hash, key| hash[key] = [] }
text.split(/\W+/).each { |word| first_letter_hash[word[0,1].downcase] << word }
p first_letter_hash
p first_letter_hash["m"]


##################################################
#NOTE:
# A 'quirk' of how Ruby handles default values in hashs
# When you create a hash with a default value (like an array[]),
# Ruby doesn't store that default value in the hash itself, it 
# stores a reference to that object to be returned whenever a
# nonexistent key is accessed.
# Therefore, while you can modify the default object (the shared
# array) you won't see changes to the hash itself.
# It's not inserting a key-value pair into the hash, just altering 
# the default arary object
##################################################
