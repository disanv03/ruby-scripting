# Sorting an Array
# Problem:
# You want to sort an array of object, possibly according to some custom notion of what "sorting" mean

# Homogeneous array of common data types, like strings or numbers, can be sorted "naturally" with Array#sort

puts [5.01, -1, 0, 5].sort

puts ["Utahraptor", "Ankylosaur", "Maiasaur"].sort


arrays = [[1, 2, 3], [100], [10, 20]]
puts arrays.sort_by { |x| x.size }

puts "###################"
puts [1, 100, 42, 23, 26, 10000].sort do |x, y|
  x == 42 ? 1 : x <=> y
end

class Animal
  attr_reader :name, :eyes, :appendages

  def initialize(name, eyes, appendages)
    @name = name 
    @eyes = eyes
    @appendages = appendages
  end

  def inspect
    @name
  end

  def to_s
    "Name: #{name}, Eyes: #{eyes}, Appendages: #{appendages}"
  end
end

animals = [Animal.new("octupus", 2, 8),
           Animal.new("spider", 6, 8),
           Animal.new("bee", 5, 6),
           Animal.new("elephant", 2, 4),
           Animal.new("crab", 2, 10)]

puts animals.sort_by { |x| x.eyes }
puts animals.sort_by { |x| x.appendages }

