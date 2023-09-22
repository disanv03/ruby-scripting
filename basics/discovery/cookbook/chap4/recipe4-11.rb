# Getting the N smallest items of an Array
# Problem:
# You want to find the smallest few items in an array, or the largest, or 
# the most extreme according to some other measure.

require_relative 'recipe4-7'

p [3, 5, 11, 16].min
p ["three", "five", "eleven", "sixteen"].min
p ["three", "five", "eleven", "sixteen"].min { |x, y| x.size <=> y.size }

p [3, 5, 11, 16].max
p ["three", "five", "eleven", "sixteen"].max
p ["three", "five", "eleven", "sixteen"].max { |x, y| x.size <=> y.size }

# Get the top 5 or the bottom 10

l = [1, 60, 21, 100, -5, 20, 60, 22, 85, 91, 4, 66]
sorted = l.sort

# the top 5
sorted[-5...sorted.size]

# the bottom 5
sorted[0...5]

##################################################
# NOTE:
# '..' => inclusive
# 1..5 => [1, 2, 3, 4, 5]
#
# '...' => exclusive
# 1...5 => [1, 2, 3, 4]
#
# sorted[-5..-1] selects the last 5 elements.
# the -1 denotes the last elements
#
# sorted[0...5] selects the first 5 elements.
# Since ... used the 5 is exclused form the selection
#
##################################################


module Enumerable
  def min_n(n, &block)
    block = Proc.new { |x,y| x <=> y } if block == nil
    stable = SortedArray.new(&block)
    each do |x|
      stable << x if stable.size < n or block.call(x, stable[-1]) == -1
      stable.pop until stable.size <= n
    end
    return stable
  end

  def max_n(n, &block)
    block = Proc.new { |x,y| x <=> y } if block == nil
    stable = SortedArray.new(&block)
    each do |x| stable << x if stable.size < n or block.call(x, stable[0]) == 1
    stable.shift until stable.size <= n
    end
    return stable
  end
end

puts "##################################################"
p l = [1, 60, 21, 100, -5, 20, 60, 22, 85, 91, 4, 66]
p l.max_n(5)
p l.min_n(5)

p l.min_n(5) { |x,y| x.abs <=> y.abs }

##################################################
#NOTE:
#
# stable << x if stable.size < n or block.call(x, stable[-1]
# Saying if stable isn't full, or x is smaller that the largest
# element in the stable then add x
#
# stable.pop until stable.size <= n
# Ensure that the stable doesn't grown beyond n elements
# by removing the largest elements
##################################################

##################################################
# EXTRA:
#
# def find_smallest_elements(arr, num_smallest)
#   champions = arr[0, num_smallest].sort
#   arr[num_smallest..-1].each do |num|
#     if num < champions[-1]
#       index = champions.bsearch_index { |x| x >= num }
#       champions.insert(index, num)
#       champions.pop
#     end
#   end
#
#   champions
# end
#
# The bsearch_index is part of the Array class in Ruby
# It performs a binary search on a sorted array for the 
# purpose of inserting a new value while maintaining the
# sorted order.
# The block provided { |x| x >= num } defines the condition.
# The binary search will find the index of the first element for
# which the block return true.
# In this case the block checks if an element x from the champions
# array is greater than or equal to num.
#
# How it works:
# champions = [1, 3, 5, 7, 9]
# num = 4
#
# The result of the binary_index would be 2. Inserting 4 into champions
# while maintaining the sorted order fit right before 5 which is at index 2.
##################################################
