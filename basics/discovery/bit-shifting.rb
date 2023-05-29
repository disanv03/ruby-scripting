(1..10).each do |n|
  puts "#{n} in binary is #{n.to_s(2)}"
end

n = 4
10.times do |i|
  shifted = n << 1
  puts "#{n}\t#{n.to_s(2)}"
  n = shifted
end
