# Iterating over a Hash
# Problem:
# You want to iterate over a hash's key-value pairs as though it were
# an array

hash = { 1 => 'one', [1,2] => 'two', 'three' => 'three' }

hash.each_pair { |key, value| puts "#{key.inspect} maps to #{value}" }

# Note that each and each_pair return the key-value pairs in an apparently random order.

# Use Hash#each_key if you only need the keys of a hash.
# In this example, a list has been stored as a hash to allow quick
# lookups (this is how the set class works)

active_toggles = { 'super' => true, 'meta' => true, 'hyper' => true }
active_toggles.each_key { |active| puts active }

favorite_colors = { 'Alice' => :red, 'Bob' => :violet, 'Mallory' => :blue, 'Carol' => :blue, 'Dave' => :violet }
summary = Hash.new 0
favorite_colors.each_value { |x| summary[x] += 1 }
p summary

# Don't iterate over Hash#each_value looking for a particular value: it's simpler and faster
# to use has_value? instead

hash = {}
1.upto(10) { |x| hash[x] = x * x }
p hash.has_value? 49
p hash.has_value? 81
p hash.has_value? 50

# 1.upto(100) { |x| hash[x] = true }
# hash.keys { |k| hash[k * 2] = true }
# RunTimeError: hash modified during iteration


hash = { 1 => 2, 2 => 2, 3 => 10 }
p hash.keys
p hash.values
p hash.to_a

extensions = { 'Alice' => '104', 'Carol' => '210', 'Bob' => '110' }
extensions.keys.sort.each do |k|
  puts "#{k} can be reached at extension ##{extensions[k]}"
end


to_do = { 'Clean-car' => 5, 'Take kangoroo to vet' => 3, 'realign plasma conduit' => 3 }
to_do.sort_by { |task, priority| [priority, task] }.each { |k,v| puts k }

transform_results = { 4 => 8, 9 => 9, 10 => 6, 2 => 7, 6 => 5 }
by_size_of_difference = transform_results.sort_by { |x,y| (x-y).abs}
by_size_of_difference.each { |x, y| puts "f(#{x})=#{y}: difference #{y-x}" }
