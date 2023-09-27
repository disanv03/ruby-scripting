# Computing Set Operations on Arrays
# Problem:
# You want to find the union, intersection, difference, or Cartesian product of two arrays,
# or the complement of a single array with respect to some universe

# Union
p [1,2,3] | [1,4,5] # => [1, 2, 3, 4, 5]

# Intersection
p [1,2,3] & [1,4,5] # => [1]

# Difference
p [1,2,3] - [1,4,5] # => [2, 3]
# return a new array of elements from the first array that are not present in the second array

require 'set'
a = [1, 2, 3]
b = [3, 4, 5]
a.to_set ^ b.to_set # => #<Set: {5, 1, 2, 4}>
# Symmetric difference, finding elements that are unique to each set
(a | b) - (a & b) # => [1, 2, 4, 5]

# The union and intersection set operations remove duplicate entries from arrays.
# The difference operation does not remove duplicate entries from an array except as part of a substraction

[3, 3] & [3, 3] # => [3]
[3, 3] | [3, 3] # => [3]
[1, 2, 3, 3] - [1] # => [2, 3, 3]
[1, 2, 3, 3] - [3] # => [1, 2]
[1, 2, 3, 3] - [2, 2, 3] # => [1]

u = [:red, :orange, :yellow, :green, :blue, :indigo, :violet]
a = [:red, :blue]
u - a

def natural_numbers_except(exclude)
  exclude_map = {}
  exclude.each { |x| exclude_map[x] = true }
  x = 1
  while true
    yield x unless exclude_map[x]
    x = x.succ
  end
end

natural_numbers_except([2,3,6,7]) do |x|
  break if x > 10
  puts x
end

##################################################
# NOTE:
# exclude.each { |x| exclude_map[x] = true }
# Iterates over each number in the 'exclude' array and sets its value in the
# exclude_map hash to true
# Create an infinite loop and yielding numbers that aren't in 'exclude'
# x.succ incrementing x
##################################################


# Cartesian Product

module Enumerable
  def cartesian(other)
    res = []
    each { |x| other.each { |y| res << [x, y] } }
    return res
  end
end

p [1,2,3].cartesian(["a",5,6])

##################################################
# NOTE:
# The Cartesian product of two set (or arrays, in programming)
# is the set of all possible ordered pairs where the first element
# of the pair comes from the first set, and the second element comes
# from the second set.
# A = [a, b]
# B = [x, y, z]
# The Cartesian product of 'A' and 'B' is:
# [(a, x), (a, y), (a, z), (b, x), (b, y), (b, z)]
# You can use the product method to get this result.
# result = A.product(B)
##################################################

# Version with inject to make more concise

module Enumerable
  def cartesian(other)
    inject([]) { |res, x| other.inject(res) { |res, y| res << [x, y] } }
  end
end

