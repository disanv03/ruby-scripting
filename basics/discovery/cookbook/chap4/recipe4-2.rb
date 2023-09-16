# Rearranging values without using temporary variables
# Problem:
# You want to rearrange a number of variables, or assign the elements of an array to individual variables

a = 1
b = 2
a, b = b, a
puts a
puts b

# More complex rearrangement
a, b, c = :red, :green, :blue
c, a, b = a, b, c
puts a
puts b
puts c

# Split out an array into its components
array = [:red, :green, :blue]
c, a, b = array
puts a
puts b
puts c

# Use the splat operator to extract items form the font of the array
a, b, *c = [12, 14, 178, 89, 90]
puts a
puts b
puts c

# Versatile assignement

a, b = 5, 10
a, b = b/a, a-1 # => [2, 4]

a, b, c = 'A', 'B', 'C'
a, b, c = [a, b], { b => c }, a

# if there are more variables on the left side of the equal sign that on the right side,
# the extra variables on the left side get assignaed 'nil'

a, b = 1, 2
a, b = b
puts a
puts b

# bitwise XOR (exclusive OR)
a, b = rand(1000), rand(1000)
a = a ^ b
b = b ^ a
a = a ^ b

puts [a, b]
