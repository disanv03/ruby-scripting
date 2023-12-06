# Initializing Instance Variables Defined by a Module
# Problem:
# You have a mixin module that defines some instance variables. Given
# a class that mixes in the module, you want to initialize the instance
# variables whenever an instance of the class is created.

module Timeable
  attr_reader :time_created
  
  def initialize
    @time_created = Time.now
  end

  def age # in seconds
    Time.now - @time_created
  end
end

class Character
  include Timeable
  attr_reader :name
  def initialize(name)
    @name = name
    super() #calls Timeable's initialize
  end
end

c = Character.new "Fred"
p c.time_created

# When a module is included in a clas, that module becomes an ancestor of
# the class. We can test this in the context of the example above by calling
# the Module#ancestors on the character class:
p Character.ancestors # => [Character, Timeable, Object, Kernel]

# When you call super from within a method (such as initialize), Ruby finds
# every ancestor that defines a method with the same name, and calls it too.
