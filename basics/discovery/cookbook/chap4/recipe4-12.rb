# Building up a Hash using Injection
# Problem:
# You want to create a hash from the values in an array


collection = [ [1, 'one'], [2, 'two'], [3, 'three'], [4, 'four'], [5, 'five'] ]

collection.inject({}) do |hash, value|
  hash[value.first] = value.last
  hash
end

p collection

##################################################
#NOTE:
# The 'inject' method is a way to accumulate a value
# across elements of an enumerable. It takes an initial 
# value and a block. The block will be called for each
# elements of the enumerable, and it's supposed to return
# an accumulated result, which will be passed as the first
# block argument to the next iteration. 
# 
# inject({}): initialize the inject method with an empty hash.
# The empty hash is the starting value and will be referred to as 'hash'
# in the block
#
# do |hash, value|: For each iteration, the block takes two arguments
# hash, this is the accumulated result. On the first iteration, it's the empty
# hash we provided. On subsequent iterationn it's whatever was returned by
# the block on the previous iteration.
# value: this is the current element of the collection array being processed
#
# hash[value.first] = value.last: This line is the core of the block.
# For each nested array in the collection:
# value.fisrt fetches the first element
# value.last fetches the last element of the nested array
# The line essentially adds a new key value pairs to the 'hash'.
# 
# hash: this returns the updated hash, so it can be useed as the accumulator for 
# the next iteration.
##################################################


class Array
  def to_h(default=nil)
    Hash[ *inject([]) { |a, value| a.push value, default || yield(value) } ]
  end
end

##################################################
#NOTE:
# Hash[1,10,2,20]
# => {1=>10, 2=>50}
# The splat operator is used to destructure the array into
# a flat list of arguments
# The splat operator doesn't work recursively on nested array,
# it only destructures the outermost array
# The Hash[ ] method expects an even number of arguments, 
# alternating between keys and values.
# The splat operator "unpacks" the array's elements to be
# treated as individual argumemts.
# Without * the Hash[] would see this as receiving a single argument (an array)
# and would raise an 'ArgumentError'
##################################################

a = [1, 2, 3]

p a.to_h(true)
p a.to_h { |value| [value * -1, value * 2] }
