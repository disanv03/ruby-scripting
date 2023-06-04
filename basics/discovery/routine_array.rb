table = (1..10).map {|i| i * 7 }

rand_a = (1..20).map { rand(1..100) }

# generate multi array other way
rows = 3
cols =  4
multi_array = Array.new(rows) { Array.new(cols, 0)} # => with 0 the value
multi_array = Array.new(rows) { Array.new(cols) { rand(1..10) } }

# two dimensional view of the array
multi_array.each do |row|
  puts row.to_s
end

multi_tables = (2..20).map { |i| (1..10).map {|j| i * j } }

new_array = mutli_tables[2].dup # => duplicate array

# relier les points entre eux.
new_a = new_array.each_cons(2).to_a
new_a.flatten!

counts = Hash.new(0)

new_again = new_a.sort.map do |number|
    counts[number] += 1
    counts[number] > 1 ? -number : number
end

# minus number first
sorted_array = new_again.sort_by { |n| [n.abs, n]}

negative_numbers = sorted_array.select { |n| n < 0 }

if sorted_array.include?(-6)
	puts "array includes -6"
	end

negative_numbers.max
negative_numbers.index(negatives.max) # the value that you are looking the index from

sum = negative_numbers.inject(0, :+)

negative_numbers[1..-1] # isolate the last number from the array
negative_numbers[1..-2] # isolate the two last number from the array

negative_numbers[-1] # return the last number

new_rand = (1..10).map { rand(1..100) }
min_diff = new_rand.sort.each_cons(2).map{|a,b| b-a}.min

