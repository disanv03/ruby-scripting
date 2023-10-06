# Iterating over a Hash in insertion order
# Problem:
# Iterations over a hash happen in a seemingly random order. Sorting the keys or values only works if the keys
# or values are all mutually comparable. You'd like to iterate over a hash in the order in which the elements were added
# to the hash.

require 'active_support'
h = ActiveSupport::OrderedHash.new
h[1] = 1
h["second"] = 2
h[:third] = 3

p h.keys
p h.values
h.each { |k, v| puts "The #{k} counting number is #{v}" }

