def find_smallest_difference()
  n = gets.to_i
  powers = Array.new(n)

  for i in 0...n
    powers[i] = gets.to_i
  end

  powers.sort!
  min_diff = Float::INFINITY

  for i in 1...n
    diff = powers[i] - powers[i - 1]
    if diff < min_diff
      min_diff = diff
    end
  end
  puts min_diff
end

find_smallest_difference()


#sweet and short

n = gets.to_i
strengths = n.times.map{ gets.to_i }
best = strengths.sort.each_cons(2).map {|a, b| b-a}.min
puts best

