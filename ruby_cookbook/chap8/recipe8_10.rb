# Getting a Human-Readable Printout of Any Object
# Problem:
# You want to look at a natural-looking rendition of a given object

a = [1, 2, 3]
puts a
puts a.to_s
puts a.inspect
puts /foo/
puts /foo/.inspect
f = File.open('foo', 'a')
puts f
puts f.inspect

periodic_table = [{ :symbol => "H", :name => "hydrogen", :weight => 1.007 },
                  { :symbol => "Rg", :name => "roentgenium", :weight => 272 }]
puts periodic_table
puts eval(periodic_table.inspect)[0]

class Dog
  def initialize(name, age)
    @name = name
    @age = age * 7
  end

  def inspect
    "<A dog named #{@name} who's #{@age} in dog years.>"
  end

  def to_s
    inspect
  end

end

spot = Dog.new("Spot", 2.1)
puts spot.inspect

# or, if you believe in being able to eval the output of inspect
class Dog
  def inspect
    human_years = @age / 7
    "Dog.new(\"#{@name}\", #{human_years})"
  end
end

# puts eval(spot.inspect)

