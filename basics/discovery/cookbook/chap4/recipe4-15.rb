# Partitioning or Classifying a Set
# Problem:
# You want to partition a set or array based on some attribute of its elements. All elements that go
# "together" in some code-specific sense should be grouped together in distinct data structures.
# For instance, if you're partitioning by color, all the green objects in a set should be grouped
# together, separate from the group of all the red objects in the set.

# Use Set#divide

require 'set'

s = Set.new((1..10).collect)
p s

# Divide the set into the "true" subset and the "false" subset: that is,
# the "less than 5" subset and the "not less than 5" subset
p s.divide { |x| x < 5 }

# Divide the set into the "0" subset and the "1" subset: that is, the
# "even" subset ansd the "odd" subset.
p s.divide { |x| x % 2 }

s = Set.new([1, 2, 3, 'a', 'b', 'c', -1.0, -2.0, -3.0])
# Divide the set into the "String" subset, the "Fixnum" subset, and the
# "Float" subset.

p s.divide { |x| x.class }

s = [1, 2, 3, -1, -2, -4].to_set

# Divide the set into sets of numbers with the same absolute value
p s.divide { |x,y| x.abs == y.abs }

# Divide the set into sets of adjacent numbers
p s.divide { |x,y| (x-y).abs == 1 }

# Classify subets by the values they have in common, use set#classify
# It returns a hash that maps the names of the subsets to the subsets themselves
s = Set.new([1, 2, 3, 'a', 'b', 'c', -1.0, -2.0, -3.0])
p s.classify { |x| x.class }

connections = { 1 => 2, 2 => 3, 3 => 1, 4 => 1 }
p [1, 2, 3, 4].to_set.divide { |x,y| connections[x] == y }

##################################################
#NOTE:
# The code uses the 'divide' method on a set to categorize its 
# elements into subsets. This method operates by essentially
# performing a Cartesian Product, evaluating all possible pairs
# (x, y) of the set. For each pair, the given block determines if they
# should be grouped together based on a condition, in this case, 'connections[x] == y'
# If the condition return true 'x' and 'y' are placed in the same subset.
# It's important to emphasize that it's the value of 'x' (not 'connections[x]') that gets
# grouped into the resultant subsets.
##################################################
# The behavior of 'divide' in the set class is to partition the set into subets based on
# the equivalence relation given in the block.
# The key here is to understand the concept of an equivalence relation, which typically 
# has three properties:
#   - Reflexivity, a is related to itself
#   - Symmetry, a related to b, b related to a
#   - Transitivity, if a is related to b, and b related to c, then a is related to c
#
# For this reason 4 isn't grouped with 1 in the same subset.
# While 4 is related to 1, the reverse isn't true. The symmetry property isn't fulfilled
# for the pair (1, 4) and as a result 4 is not placed in the same subset as 1, 2, 3
#
# In simpler terms, while 4 points to 1, there's no direct connection that point back to 4
# from 1, 2 or 3. So, 4 ends up in its own subset.
##################################################


class Array
  def classify
    h = {}
    each do |i|
      x = yield(i)
      (h[x] ||= self.class.new) << i
    end
    h
  end

  def divide(&block)
        Set.new(classify(&block).values)
  end
end

##################################################
# NOTE:
# The classify method is a clear illustration of the use
# of blocks
# i: Block Parameter or Block Argument
# x: Block Return value
#
# For each element in the array
# exec the provided block with i and assign the result to x
# If h doesn't have a key x, create new empty array, then append i
# h[x] ||= self.class.new
# or-equal operator will assign a value to h[x] only if h[x] is currently nil or false ("if_exist" operator)
# equivalent of if h[x].nil? || h[x] == false
##################################################
p [1, 1, 2, 6, 6, 7, 101].divide { |x| x % 2 }

# p [1, 1, 2, 6, 6, 7, 101].divide { |x, y| (x-y).abs == 1 }
