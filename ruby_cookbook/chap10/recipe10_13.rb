# Undefining a method
# Problem:
# You want to remove an already defined method from a class or module

class RandomizingArray < Array
  def <<(e)
    insert(rand(size), e)
  end

  def [](i)
    super(rand(size))
  end
end

a = RandomizingArray.new
p a << 1 << 2 << 3 << 4 << 5 << 6

# That was fun; now let's get some of those entries back
a[0] # => 1 
a[0] # => 2 
a[0] # => 5 
# No, seriously, a[0]
a[0] # => 4 
# It's a madhouse! A madhouse!
a[0] # => 3 

# That does it!
class RandomizingArray
  remove_method('[]')
end

a[0] # => 3 
a[0] # => 3 
a[0] # => 3 

# But the overriden << operator still works randomly:

class RandomizingArray
  remove_method(:length)
end
# NameError: method 'length' not defined in RandomizingArray

class RandomizingArray
  undef_method(:length)
end

RandomizingArray.new.length
# NoMethodError: undefined method 'length' for []:RandomizingArray
Array.new.length # => 0

my_array = Array.new
def my_array.random_dump(number)
  number.times { self << rand(100) }
end

my_array.random_dump(3)
my_array.random_dump(2)
my_array

# That's enough of that.
class << my_array
  remove_method(:random_dump)
end
my_array.random_dump(4)
# NoMethodError: undefined method 'random_dump' for []:Array

class OneTimeContainer
  def initialize(value)
    @use_just_once_then_destroy = value
  end

  def get_value
    remove_instance_variable(:@use_just_once_then_destroy)
  end
end

object_1 = OneTimeContainer.new(6)
object_1.get_value # => 6
object_1.get_value # NameError: instance variable @use_just_once_then_destroy not defined
object_2 = OneTimeContainer.new('ephemeron')
object_2.get_value

class MyClass
  remove_instance_variable(:@use_just_once_then_destroy)
end
# NameError: instance variable @use_just_once_then_destroy not defined
