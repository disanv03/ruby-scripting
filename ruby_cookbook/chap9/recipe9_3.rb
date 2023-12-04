# Implementing Enumerable: Write one method, get 22 free
# Problem:
# You want to give a class all the useful iterator and iteration-related
# features of Ruby's arrays (sort, detect, inject, and so on), but your
# class can't be a subclass of Array. You don't want to define all those
# methods yourself

class MultiArray
  include Enumerable
  def initialize(*arrays)
    @arrays = arrays
  end

  def each
    @arrays.each { |a| a.each { |x| yield x } }
  end
end

ma = MultiArray.new([1, 2], [3], [4])
p ma.collect
p ma.detect { |x| x > 3 }
p ma.map { |x| x ** 2 }
p ma.each_with_index { |x, i| puts "Element #{i} is #{x}" }

p Enumerable.instance_methods.sort

ma.sort
mixed_type_ma = MultiArray.new([1, 2,3], ["a", "b", "c"])
#mixed_type_ma.sort # ArgumentError: comparison of Fixnum with String failed
#[1, 2, 3, "a", "b", "c"].sort
# ArgumentError: comparison of Fixnum with String failed

class Module
  include Enumerable
  def each
    instance_methods.each { |x| yield x }
  end
end

# Find all instance methods of String that modify the string in place.
p String.find_all { |method_name| method_name[-1] == ?! }

# Find all instance methods of Fixnum that take 2 arguments.
sample = 0
p sample.class.find_all { |method_name| sample.method(method_name).arity == 2 }

