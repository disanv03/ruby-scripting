# Accepting or Passing a variable number of arguments
# Problem:
# You want to write a method that can accept any number of arguments. Or maybe you want
# to pass the contents of an array as arguments into such a method, rather than passing
# in the array itself as a single argument.


def sum(*numbers)
  puts "I'm about to sum the array #{numbers.inspect}"
  numbers.inject(0) { |sum, x| sum += x }
end

puts sum(1, 2, 10)
puts sum(2, -2, 2, -2, 2, -2, 2, -2, 2)
puts sum

to_sum = []
1.upto(10) { |x| to_sum << x }
puts sum(*to_sum)

# printf('%s | %s', 'left', 'right')
# inputs = ['left', 'right']
# printf('%s | %s', *inputs)

def format_list(header, footer='', *data)
  puts header
  puts (line = '-' * header.size)
  puts data.join("\n")
  puts line
  puts footer
end
cozies = 21
gaskets = 10
format_list("Yesterday's productivity numbers:", 'Congratulations!', "#{cozies} slime mold cozies",
            "#{gaskets} Sierpinski gaskets")

# Range take an optional boolean argument that specifies whether the range should be exclusive or inclusive.
# true for ... (exclude)
# false for .. (include)
ranges = [[1,10], [1,6,true], [25,100,false], [6,9]]
p ranges.collect { |l| Range.new(*l) }
