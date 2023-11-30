# Declaring Constants
# Problem:
# You want to prevent a variable from being assigned a different value
# after its initial definition

not_a_constant = 3
not_a_constant = 10

A_CONSTANT = 3
A_CONSTANT = 10 # warning: already initialized constant A_CONSTANT

CONST = 4
module ConstModule
  CONST = 6
end

class ConstHolder
  CONST = 8
  def my_const
    return CONST
  end
end

p CONST # => 4
p ConstModule::CONST # => 6
p ConstHolder::CONST # => 8
p ConstHolder.new.my_const # => 8

# change the reference to point to a different object
E = 2.718281828
E = 6 # => warning: already initialized constant E
p E # => 6

module Math
  remove_const(:PI)
  PI = 3
end

p Math::PI

# If a constant points to a mutable object like an array or a string, the object
# can change without triggering the constant warning
p RGB_COLORS = [:red, :green, :blue]
p RGB_COLORS << :purple
p RGB_COLORS = [:red, :green, :blue] # warning: already initialized
RGB_COLORS.freeze
#RGB_COLORS << :purple # TypeError: can't modify frozen array

HOURS_PER_DAY = 24
p HOURS_PER_DAY << 1
p HOURS_PER_DAY
HOURS_PER_DAY.freeze # Fixnums are already immutable
p HOURS_PER_DAY = 26 # warning: already initialized
p HOURS_PER_DAY # => 26


