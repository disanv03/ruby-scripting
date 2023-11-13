# Changing the way on Object Iterates
# Problem:
# You want to use a data structure as an Enumerable, but the object's
# implementation of #each doesn't iterate the way you want. Since all
# of Enumerable's methods are based on each, this makes them all useless to you

array = %w[bob loves alice]
p array.collect { |x| x.capitalize }

# Suppose we want to have a method like collect_reverse
# array.collect_reverse { |x| x.capitalize }
# => ["Alice", "Loves", "Bob"]

require 'enumerator'
reversed_array = array.to_enum(:reverse_each)
p reversed_array.collect { |x| x.capitalize }

array_with_index = array.each_with_index
array_with_index.each do |x, i|
  puts %{#{i}=>"#{x}"}
end

array_with_index.each_with_index do |x, i|
  puts %{#{i}=>#{x.inspect}}
end

sentence = %w[well, now I've seen everything!]
two_word_window = sentence.to_enum(:each_cons, 2)
two_word_window.each { |x| puts x.inspect }

two_words_at_a_time = sentence.to_enum(:each_slice, 2)
two_words_at_a_time.each { |x| puts x.inspect }
