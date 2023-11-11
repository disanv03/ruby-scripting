# frozen_string_literal: true

# Writing an Iterator Over a Data Structure
# Problem:
# You've created a custom data structure, and you want to implement an each method on it,
# or you want to implement an unusual way of iterating over an existing data structure

# Here's a simple tree data structure.
# A tree contains a single value, and a list of children (each of which is a smaller tree)
class Tree
  attr_reader :value

  def initialize(value)
    @value = value
    @children = []
  end

  def <<(value)
    subtree = Tree.new(value)
    @children << subtree
    subtree
  end

  def each(&block)
    yield value
    @children.each do |child_node|
      child_node.each(&block)
    end
  end
end

t = Tree.new('Parent')
child1 = t << 'Child 1'
child1 << 'GrandChild 1.1'
child1 << 'Grandchild 1.2'
child2 = t << 'Child 2'
child2 << 'Grandchild 2.1'

t.each { |x| puts x }

# Using while loop to iterate over an array from both sides
class Array
  def each_from_both_sides
    front_index = 0
    back_index = length - 1
    while front_index <= back_index
      yield self[front_index]
      front_index += 1
      if front_index <= back_index
        yield self[back_index]
        back_index -= 1
      end
    end
  end
end

%w[Curses! been again! foiled I've].each_from_both_sides { |x| puts x }

# Two more simple iterators.
# The first one yields each element multiple times in a row.
# The next one returns the elements of an enumerable in random order.
module Enumerable
  def each_n_times(num)
    each { |e| num.times { yield e } }
  end

  def each_randomly(&block)
    (sort_by { rand }).each(&block)
  end
end

%w[Hello Echo].each_n_times(3) { |x| puts x }
%w[Eat at Joe's.].each_randomly { |x| puts x }
