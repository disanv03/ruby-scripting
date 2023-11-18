# Managing Instance Data
# Problem:
# You want to associate a variable with an object. You may also want the variable to
# be readable or writable form outside the object.

class Frog
  attr_reader :name
  attr_accessor :speaks_english

  def initialize(name)
    @name = name
  end

  def speak
    # Only frogs with long names speak english.
    @speaks_english ||= @name.size > 6
    @speaks_english ? "Hi. I'm #{@name}, the talking frog." : 'Ribbit.'
  end
end

p Frog.new('Leonard').speak
lucas = Frog.new('Lucas')
p lucas.speak

# If you want to make an instance variable readable from outside the object,
# call attr_reader method on its symbol
p lucas.name

# Similarly to make an instance variable readable and writable from outside the object,
# call the attr_accessor on its symbol
lucas.speaks_english = true
p lucas.speak

# To get or set the value of an instance variable from outside the object that owns it,
# you need  to call an explicitly defined getter or setter method
class Frog
  def speaks_english
    @speaks_english
  end
  def speaks_english=(value)
    @speaks_english = value
  end
end

michael = Frog.new("Michael")
p michael.speak
p michael
p michael.instance_variable_get("@name")
p michael.instance_variable_set("@name", 'Bob')
p michael.name

# This use (below) doesn't violate encapsulation
# (though there's no real need to call define_method here)

class Frog
  define_method(:scientific_name) do
    species = 'vulgaris'
    species = 'loquacious' if instance_variable_get('@speaks_english')
    "Rana #{species}"
  end
end

p michael.scientific_name