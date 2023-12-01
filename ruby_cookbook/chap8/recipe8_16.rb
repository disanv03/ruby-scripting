# Making a copy of an object
# Problem:
# You want to make a copy of an existing object: a new object that can
# be modified separately from the original

s1 = 'foo'
s2 = s1.clone
s1[0] = 'b'
p [s1, s2] # => ["boo", "foo"]

material = 'cotton'

# Singleton class
# This allow to define methods that are only available
# on that particular instance of the object, rather than
# on all instance of the object's class
class << material
  def definition
    puts 'the better half of velour'
  end
end

material.definition # => the better half of velour
#'cotton'.definition  #NoMethodError
material.clone.definition # => the better half of velour
#material.dup.definition #NoMethodError

class StringHolder
  attr_reader :string

  def initialize(string)
    @string = string
  end
end

s1 = StringHolder.new('string')
s2 = s1.dup
s3 = s1.clone

s1.string[1] = 'p'
p s2.string # => "spring"
p s3.string # => "spring"

class Object
  def deep_copy
    Marshal.load(Marshal.dump(self))
  end
end

s1 = StringHolder.new('string')
s2 = s1.deep_copy
s1.string[1] = 'p'
p s1.string # => "spring"
p s2.string # => "string"

class << s1
  def definition
    puts "we hold strings so you don't have to."
  end
end
#s1.deep_copy # TypeError: singleton can't be dumped

class StringHolder
  def initialize_copy(from)
    @string = from.string.dup
  end
end

s1 = StringHolder.new('string')
s2 = s1.dup
s3 = s1.clone
s1.string[1] = "p"
p s2.string # => "string"
p s3.string # => "string"

##################################################
# Definition:
#   - serialize:
#       Converting an object into a format that can
#       be easily saved to a persistent storage
#   - singleton:
#       A method defined on one specific object
#   - tainted:  
#       In Ruby an object is tainted if it is affected by data from
#       an external source
##################################################
