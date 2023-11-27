# Converting and Coercing Objects to Different types
# Problem:
# You have an object of one type and you want tu use it as though it were of another type

p "4".to_i
p 4.to_s
p Time.now.to_f
hash = { "key1" => "value1", "key2" => "value2" }.to_a
p hash

def print_each(array)
  array.each { |x| puts x.inspect }
end

hash = {"pickled peppers" => "peck of",
         "sick sheep" => "sixth"}
print_each(hash.to_a)
print_each(hash)

array = hash.to_a
until array.empty?
  item, quantity = array.pop
  puts "#{quantity} #{item}"
end

# Some methods convert one data type to another as a side effect
p hash.sort

p 3/4
p 3/4.to_f

require 'rational'
p Rational(1,3).to_f
p Rational(11,5).to_i
p 2.to_r

require 'bigdecimal'
require 'bigdecimal/util'

one_third = 1/3.0
#one_third.to_r # => NoMethodError: undefined method 'to_r' for 0.33333333333333333333:Float
one_third.to_d.to_r # => Rational(33333333333333, 10000000000000000000000)

# The best way to convert an integer to bigdecimal, is to convert it to a rational first
#20.to_d # => NoMethodError
#20.to_r.to_d

require 'complex'
p i = Complex(0,1)
p i.coerce(3)
p i.coerce(2.5)
