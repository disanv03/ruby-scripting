# Extracting Portions of Arrays
# Problem:
# Given an array, you want to retrieve the elements of the array that occupy certain
# positions or have certain properties. You might to do this in a way that removes
# the matching elements from the original array.

# Retrieval operator []
# To gather a chunk of an array without modifying it.
p a = ("a".."h").to_a
p a[0]
p a[1]

p a.at(1)
p a.slice(1)
p a[-1]
p a[-2]
p a[1000]
p a[-1000]

# Array[range]
# This form retrieves every element identified by an index in the given
# range, ans returns those elements as a new array.

p a[2..5]
p a[2...5]
p a[0..0]
p a[1..-4]
p a[5..1000]

p a[2..0]
p a[0...0]
p a[-3..2]

# Array[start_index, length]. This is equivalent of array[range.new(start_index...start_index+length)]

p a[2, 4]
p a[2, 3]
p a[0, 1]
p a[1, 2]
p a[-4, 2]
p a[5, 1000]

# To remove a slice from the array use Array#slice!

p a.slice!(2..5)
p a
a.slice!(0)
p a
a.slice!(1,2)
p a

# Nondestructively gather the elements at particular indexes in an array

a = ("a".."h").to_a
p a.values_at(0)
p a.values_at(1, 0, -2)
p a.values_at(4, 6, 6, 7, 4, 0, 3)

# Enumerable#find_all finds all elements in an array for which the specified code block 
# returns true.
# Enumerable#reject will find all elements for which the specified code block returns false.
# NOTE: In ruby, 'find_all' and 'select' are aliases for the same method when used on an 'Enumerable'
# both iterate over the elements and return an array containing all the elements for which the given
# block returns a truthy value

p a.find_all { |x| x < "e" }
p a.select { |x| x < "e" }
# p a.reject { |x| x < "e" }

# To find all elements in an array that match a regular expression, you can use
# Enumerable#grep

p a.grep /[aeiou]/
p a.grep /[^g]/

class Array
  def strip_values_at!(*args)
    #For each mentioned index, replace its value with a dummy object.
    values = []
    dummy = Object.new
    args.each do |i|
      if i < size
      values << self[i]
      self[i] = dummy
      end
    end
    # Strip out the dummy object
    delete(dummy)
    return values
  end
end

a = ("a".."h").to_a
p a.strip_values_at!(1, 0, -2)
p a

a.strip_values_at!(1000)
p a

# class Array
#   def extract!
#     ary = self.dup
#     self.reject! { |x| yield x }
#     ary - self # returns a new array minus the reject array items
#   end
# end
# 
# a = ("a".."h").to_a
# a.extract! { |x| x < "e" && x != "b" }

# class Array
#   def grep_extract!(re)
#     extract! { |x| re.match(x) }
#   end
# end
# 
# a = ("a".."h").to_a
# a.grep_extract!(/[aeiou]/)
# p a
