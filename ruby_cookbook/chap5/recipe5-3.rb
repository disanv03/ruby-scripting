# Adding Elements to a Hash
# Problem:
# You have some items, loose or in some other data structure,
# which you want to put into an existing hash.

h = {}
h["Greensleeves"] = "all my joy"
p h
h["Greensleeves"] = "my delight"
p h


key = "Modify me if you can"
h = { key => 1 }
p key.upcase!
p h[key]
p h["Modify me if you can"]

p h.keys
# p h.keys[0].upcase!

# Add an array of key-value pairs to a hash

squares = [[1,1], [2,4], [3,9]]
results = {}
squares.each { |k,v| results[k] = v }
p results

my_hash = squares.inject({}) { |h, kv| h[kv[0]] = kv[1]; h }
p my_hash

##################################################
# NOTE:
# inject enumerable in Ruby
# The argument({}) is used as the inital value for 
# the accumulator (h)
# The method processes each element of the enumerable
# passing the accumulator and the current element to
# the block.
##################################################

# Turn the flat array into key-value pairs of a hash

class Array
  def into_hash(h)
    unless size % 2 == 0
      raise StandardError, "Expected array with even number of elements"
    end
    0.step(size-1, 2) { |x| h[self[x]] = self[x+1] }
    h
    end
end

squares = [1, 2, 3, 4, 9, 10]
results = {}
p squares.into_hash(results)
# p [1,1,2].into_hash(results)

##################################################
# Step method in pseudo code:
# start_from.step(until, step_size) do |variable| ... end
# |variable| is the placeholder for the current value
# of the iterator in each iteration.
##################################################


# Insert into a hash every key-value form another hash

squares = { 1 => 1, 2 => 4, 3 => 9}
cubes = { 3 => 27, 4 => 256, 5 => 3125 }
squares.merge!(cubes)
p squares
p cubes

squares = { 1 => 1, 2 => 4, 3 => 9}
cubes = { 1 => 1, 2 => 8, 3 => 27 }
squares.replace(cubes)
p squares

cubes[4] = 64
p squares

# Hash#replace is useful for reverting a Hash to know default values.
defaults = { :verbose => true, :help_level => :beginner }
args = {}
# requests.each do |request|
  # args.replace(defaults)
  # request.process(args)
# end

puts "Before replace"
p args
args.replace(defaults)
puts "After replace"
p args

# If empty, it will be populated with the key-value pairs from the provided hash.
