# Iterating Over an array
# Problem:
# You want to perform some operation on each item in an array

[1, 2, 3, 4].each { |x| puts x }

exp = [1, 2, 3, 4].collect { |x| x ** 2 } 
puts exp

['a', 'b', 'c'].each_with_index do |item, index|
  puts "At position #{index}: #{item}"
end

[1, 2, 3, 4].reverse_each { |x| puts x }

array = ['a', 'b', 'c']
array.collect! { |x| x.upcase }
puts array
array.map! { |x| x.downcase }
puts array


array = ['junk', 'junk', 'junk', 'val1', 'val2']
3.upto(array.length-1) { |i| puts "Value #{array[i]}" }

array = ['1', 'a', '2', 'b', '3', 'c']
(0..array.length-1).step(2) do |i|
  puts "Letter #{array[i]} is #{array[i+1]}"
end

for element in ['a', 'b', 'c']
  puts element
end

for element in (1..3)
  puts element
end

# All three of the following code snippets generate the same output
array = ['cherry', 'strawberry', 'orange']

for index in (0..array.length)
  puts "At position #{index}: #{array[index]}"
end

index = 0
while index < array.length
  puts "At position #{index}: #{array[index]}"
  index += 1
end

index = 0
until index == array.length
  puts "At position #{index}: #{array[index]}"
  index += 1
end


# Hybrid of each and each_reverse

array = [1,2,3,4,5]
new_array = []
front_index = 0
back_index = array.length-1

while front_index <= back_index
  new_array << array[front_index]
  front_index += 1
  if front_index <= back_index
    new_array << array[back_index]
    back_index -= 1
  end
end

class Array
  def each_from_both_sides
    front_index = 0
    back_index = self.length-1
    while front_index <= back_index
      yield self[front_index]
      front_index += 1
      if front_index <= back_index
        yield self[back_index]
        back_index -= 1
      end
    end
  end

  def collect_from_both_sides
    new_array = []
    each_from_both_sides { |x| new_array << yield(x) }
    return new_array
  end

end

new_array = []
[1,2,3,4,5].each_from_both_sides { |x| new_array << x }
puts new_array

["ham", "eggs", "and"].collect_from_both_sides { |x| x.capitalize }
