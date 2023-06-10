# def: traffic terminology of yield fitting well with Ruby paradigm
# "yield" referes to letting other road users go first.

# IA exemple:
def my_method
  puts "reached the top"
  yield
  puts "reached the bottom"
end

my_method do
  puts "reached yield"
end

# We can also pass parameters to the block through 'yield'
def my_method
  yield("John", 23)
end

my_method do |name, age|
  puts "#{name} is #{age} years old"
end

# Including iterator
def iterate_elements(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

my_array = [1, 2, 3, 4, 5]

iterate_elements(my_array) do |element|
  puts element
end

# with Enumerator
def infinite_sequence
  Enumerator.new do |yielder|
    num = 1
    loop do 
      yielder.yield num 
      num += 1
    end
  end
end

sequence = infinite_sequence

5.times { puts sequence.next }
