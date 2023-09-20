# Sorting an Array by Frequency of Appearance
# Problem:
# You want to sort an array so that its least-frequently-appearing items come first

module Enumerable
  def sort_by_frequency
    histogram = inject(Hash.new(0)) { |hash, x| hash[x] += 1; hash }
    sort_by { |x| [histogram[x], x] }
  end
  
  def sort_by_frequency_faster
    histogram = inject(Hash.new(0)) { |hash, x| hash[x] += 1; hash }
    sort_by { |x| histogram[x] }
  end

  def sort_by_frequency_descending
    histogram = inject(Hash.new(0)) { |hash, x| hash[x] += 1; hash }
    sort_by { |x| [histogram[x] * -1, x] }
  end

  def sort_distinct_by_frequency
    histogram = inject(Hash.new(0)) { |hash, x| hash[x] += 1; hash }
    histogram.keys.sort_by { |x| [histogram[x], x] } 
  end
end

puts [1, 2, 3, 4, 1, 2, 4, 8, 1, 4, 9, 16].sort_by_frequency
puts [1, 2, 3, 4, 1, 2, 4, 8, 1, 4, 9, 16].sort_by_frequency_faster
puts [1, 2, 3, 4, 1, 2, 4, 8, 1, 4, 9, 16].sort_by_frequency_descending
puts [1, 2, 3, 4, 1, 2, 4, 8, 1, 4, 9, 16].sort_distinct_by_frequency
