# Chapter 5: Hashes

# Different syntaxes for creating hashes
empty = Hash.new
empty = {}

p numbers = { 'two' => 2, 'eigth' => 8}
p numbers = Hash['two', 2, 'eight', 8]

# Hashes lookup

p numbers["two"]
p numbers["ten"] = 10
p numbers

p numbers.keys
p numbers.values
p numbers.to_a

# Like an array, hash contains reference to objects, not copies of them
motto = "don't tread on me "
flag = { :motto => motto,
         :picture => "rattlesnake.png"}

motto.upcase!
p flag[:motto]

# A hash has no natural ordering, since its keys can be any objects at all.
# Array and hash comparison

a = ["Mauray", "Momento", "123 Elm Street.", "West Covina", "CA"]
h = { :first_name => "Mauray",
      :last_name => "Momento",
      :address => "123 Elm Street.",
      :city => "West Covina",
      :state => "CA" }

a = [1, 4, 9, 16]
h = { :one_squared => 1, :two_squared => 4, :three_squared => 9, :four_squared => 16 }

# A hash in Ruby is actually implemented as an array. When you look up a key in a hash,
# Ruby calculates the "hash code" of the key by calling its hash method. The result is used
# as a numeric index in the array.
class StringHolder
  attr_reader :string
  def initialize(s)
    @string = s
  end
  
  def ==(other)
    @string == other.string
  end

  def hash
    @string.hash
  end
end

a = StringHolder.new("The same string")
b = StringHolder.new("The same string")
p a == b
p a.hash
p b.hash
