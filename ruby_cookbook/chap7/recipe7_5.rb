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
