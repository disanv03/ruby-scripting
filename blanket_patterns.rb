# Solution 1
# Integer#modulo divides a number by another and returns the remainder

colors = "RRGGBBYYKK"
lines = 20

count = 0
while count < lines
    start = count.modulo(colors.length)
    first_half = colors[start..-1]
    second_half = colors[0...start]
    puts first_half + second_half
    count += 1
end

# Solution 2
# Modifies the string by moving first character to the end

colors = "RRGGBBYYKK"
lines = 20

lines.time do |i|
    first = colors[0]
    rest = colors[1..-1]
    colors = rest + first
    puts colors
end

# Solution 3
# Converts the string to an array
# the modifies array by moving first object to end

colors = "++*~~*++*"
lines = 20

colors_array = colors.split('') # this splits the string into an array f individual characters
1.upto(lines) do |i|
    first = colors_array.shift
    colors_array << first
    puts colors_array.join
end


# Fancy Blankets
# Changes characters at halfway point
# Reverses direction after halfway point

colors = "=|/|/|=|/|"
lines = 20
halfway = (lines / 2).floor

colors_array = colors.split('')

# output first half
1.upto(halfway) do |i|
  first = colors_array.shift
  colors_array << first
  puts colors_array.join
end

# Swap characters and output the result
colors_array.length.times do |x|
  if colors_array[x] == '/'
    colors_array[x] = '\\'
  end
end
puts colors_array.join

# output second half
halfway.upto(lines) do |i|
  last = colors_array.pop
  colors_array.unshift(last)
  puts colors_array.join
end
