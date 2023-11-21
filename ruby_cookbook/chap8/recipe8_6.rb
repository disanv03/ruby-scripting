# Validating and Modifying Attribute Values
# Problem:
# You want to let outside code set your object's instance variables, but
# you also want to impose some control over the values your variables are set to.
# You might want to accept values in a form convenient to the caller, but
# transform them into a different form for internal storage.

class Name

  # Define default getter methods, but not setter methods
  attr_reader :first, :last

  # When someone tries to set a first name, enforce rules about it.
  def first=(first)
    if first == nil or first.size == 0
      raise ArgumentError.new('Everyone must have a first name.')
    end
    first = first.dup
    first[0] = first[0].chr.capitalize
    @first = first
  end

  # When someone tries to set a last name, enfore rules about it.
  def last=(last)
    if last == nil or last.size == 0
      raise ArgumentError.new('Everyone must have a last name.')
    end
    @last = last
  end

  def full_name
    "#{@first} #{@last}"
  end

  # Delegate to the setter methods instead of setting the instance variable directly.
  def initialize(first, last)
    self.first = first
    self.last = last
  end
end

jacob = Name.new('Jacob', 'Berendes')
jacob.first = 'Mary Sue'
p jacob.full_name

john = Name.new('john', 'von Neumann')
p john.full_name
john.first = 'john'
p john.first
# john.first = nil

# Name.new('Kero, internation football star', nil)

class SimpleContainer
  attr_accessor :value
end

c = SimpleContainer.new
p c.respond_to? "value="
p c.value = 10
p c.value = "some random value"
p c.value = [nil, nil, nil]