######################
# Iterate
######################
# to say or do again
# to apply a procedure repeatedly
# to perfrom code on each item in a set
######################

i = 5
i.times do
    puts "Countdown: #{i}"
    i-= 1
end
puts "Blast off!"

# Iterators: times, upto, downto, each
5.times { puts "Hello" }
1.upto(5) { puts "Hello" }
5.downto(1) { puts "Hello" }
(1..5).each { puts "Hello" }

5.downto(1) do |i|
    puts "Countdown: #{i}"
end
puts "Blast off!"

#######################
# Iterators: By class
#######################
# integer: times, upto, downto, step
# range: each, step
# string: each_line, each_char, each_byte
# array: each, each_index, each_with_index
# hash: each, each_key, each_value, each_pair
#######################

fruits = ['banana', 'apple', 'pear']

# Encourage you to use the block format
fruits.each do  |fruit|
    puts fruit.capitalize
    puts fruit.upcase
end

for fruit in fruits
    puts fruit.capitalize
end

