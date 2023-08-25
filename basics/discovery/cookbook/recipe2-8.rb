# Finding Mean, Median, and Mode
# Problem:
# You want to find the average of an array of numbers: its mean, median, or mode.

def mean(array)
  sum = array.inject(0) { |sum, x| sum + x }
  sum / array.size.to_f
end

puts mean([1,2,3,4])
puts mean([100,100,100,100.1])
puts mean([-100, 100])
puts mean([3,3,3,3])

def median(array, already_sorted=false)
  return nil if array.empty?
  array = array.sort unless already_sorted
  m_pos = array.size / 2
  return array.size % 2 == 1 ? array[m_pos] : mean(array[m_pos-1..m_pos])
end

puts median([1,2,3,4,5])
puts median([5,3,2,1,4])
puts median([1,2,3,4])
puts median([1,1,2,3,4])
puts median([2,3,-100,100])
puts median([1,1,10,100,1000])

def modes(array, find_all=true)
  histogram = array.inject(Hash.new(0)) { |h, n| h[n] += 1; h }
  modes = nil
  histogram.each_pair do |item, times|
    modes << item if modes && times == modes[0] and find_all
    modes = [times, item] if (!modes && times>1) or (modes && times>modes[0])
  end
  return modes ? modes[1..modes.size] : modes
end

# next play with inject, hash, each_pair
