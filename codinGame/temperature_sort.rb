# cours
array = [[1, 2], [1, 1], [1, 3], [2, 2], [2, 1]]

# tri selon le second élément de chaque sous-array
sorted_array = array.sort_by { |element| element[1] }
# => [[1, 1], [2, 1], [1, 2], [2, 2], [1, 3]]

array2 = (1..10).map { gets.to_i }
# => [-2, 2, -434, -6, 6, 6, 43, -3, 1, 10]

sorted_array = array2.sort_by {|temp| temp.abs}
# => [1, 2, -2, -3, 6, 6, -6, 10, 43, -434]
sorted_array = array2.sort_by {|temp| [temp.abs, temp]}
# => [1, -2, 2, -3, -6, 6, 6, 10, 43, -434]


# try it !
n = gets.to_i # the number of temperatures to analyse
inputs = gets.split(" ")
t = []
for i in 0..(n-1)
  # t: a temperature expressed as an integer ranging from -273 to 5526
  t << inputs[i].to_i
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

if t.empty?
  puts "0"
else
  result = t.sort_by { |temp| [temp.abs, -temp]}.first
  puts "#{result}"
end


# short and sweet

n = gets.to_i
if n==0
    p 0
else
    p gets.split(' ').map(&:to_i).min_by {|v| [v.abs, -v]}
end