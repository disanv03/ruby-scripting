# Extending Specific Objects with Modules
# Problem:
# You want to add instance methods from a module (or modules) to specific
# objects. You don't want to mix the module into the object's class,
# because you want certain objects to have special abilities.

class Person
  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
    @name, @age, @occupation = name, age, occupation
  end

  def mild_mannered?
    true
  end
end

jimmy = Person.new('Jimmy Olsen', 21, 'club reporter')
clark = Person.new('Clack kent', 35, 'reporter')
p jimmy.mild_mannered?
p clark.mild_mannered?

module SuperPowers
  def fly
    'Flying!'
  end

  def leap(what)
    "Leaping #{what} in a single bound!"
  end

  def mild_mannered?
    false
  end

  def superhero_name
    'Superman'
  end
end

clark.extend(SuperPowers)
p clark.superhero_name
p clark.fly
p clark.mild_mannered?
p jimmy.mild_mannered?

# The extend method is used to mix a module's methods into an object,
# while include is used to mix a module's methods into a class.

class Person
  extend SuperPowers
end

# which is equivalent to:
Person.extend(SuperPowers)
# This means that the methods defined in the SuperPowwers module have now
# become class method of Person:
p Person.superhero_name
p Person.fly
