# Building a Histogram
# Problem:
# You have an array that contains a lot of references to relatively few objects. You want
# to create a histogram, or frequency map - something you can use to see how often a given
# object shows up in the array

module Enumerable
  def to_histogram
    inject(Hash.new(0)) { |h, x| h[x] += 1; h }
  end
end

p [1, 2, 2, 2, 3, 3].to_histogram

p ["a", "b", nil, "c", "b", nil, "a"].to_histogram

p "Aye\nNay\nNay\nAbstaining\nAye\nNay\nNot Present\n".split.to_histogram
survey_results = { "Alice" => :red, "Bob" => :green, "Carol" => :green, "Mallory" => :blue }
p survey_results.values.to_histogram

def draw_graph(histogram, char="#")
  pairs = histogram.keys.collect { |x| [x.to_s, histogram[x]] }.sort
  largest_key_size = pairs.max { |x,y| x[0].size <=> y[0].size }[0].size
  pairs.inject("") do |s,kv|
    s << "#{kv[0].ljust(largest_key_size)} |#{char*kv[1]}\n"
  end
end

puts draw_graph(survey_results.values.to_histogram)

random = []
100.times { random << rand(10) }
puts draw_graph(random.to_histogram)

##################################################
# NOTE: Explanation of draw_graph method
# 'histogram.keys.collect { |x| [x.to_s, histogram[x]] }.sort
# Extracts keys from the histogram, converts them to string,
# and pairs them with their respective values, creating a nested array
# '.sort' sorts these key-value pairs based on the keys. (dictionary order, as key is a string)
#
# 'largest_key_size': is used for alignement purposes.
# ljust = left-justified and space would be added on the right to meet
# the given width (largest_key_size)
#
##################################################
