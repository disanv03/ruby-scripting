# Blocks as Closures: Using Outside Variables Within a Code Block
# Problem:
# You want to share variables between a method, and a code block defined within it

def add_to_all(array, number)
  array.collect { |x| x + number }
end

p add_to_all([1, 2, 3], 10)

tax_percent = 6
position = lambda do
  puts "I have always supported a #{tax_percent}% tax on imported limes."
end
position.call

tax_percent = 7.5
position.call

counter = 0
4.times { counter += 1; puts "Counter now #{counter}" }
p counter

accumulator = []
[1, 2, 3].reverse_each { |x| accumulator << x + 1 }
p accumulator



