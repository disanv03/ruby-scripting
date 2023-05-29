#cours
mountains = [
  {name: 'Everest', height: 8848},
  {name: 'K2', height: 8611},
  {name: 'Kangchenjunga', height: 8586}
]

highest_mountain = mountains.max_by { |mountain| mountain[:height] }

puts "Highest_mountain is #{highest_mountain[:name]}"

#coding games
loop do
  mountains = []
  8.times do
    mountains << gets.to_i
  end

  highest_mountain = mountains.max
  highest_mountain_index = mountains.index(highest_mountain)

  puts "#{highest_mountain_index}"
end

#answer
loop do 
   heights = []

   8.times do
     heights << gets.to_i
   end

  puts heights.index(heights.max)
end

#short and sweet
loop do
  heights = (1..8)map {gets.to_i}
  puts heights.index(heights.max)
end


