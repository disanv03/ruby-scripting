# => input some_variable in snake_case
# => output camelCase

# with each
string = gets.chomp
parts = string.split("_")

result = []

parts.each do |word|
  if word == parts[0]
    result << word
  else
    result << word.capitalize
  end
end

# .map, automatically handles the creation of a new array as a returned value
# parts.each.map do |word|
#   word == parts[0] ? word : word.capitalize
# end
#
# Also we can use .each_with_index to keep track of the index give the tips
# of doing index == 0 instead of using parts[0] 
# for example:
# parts.each_with_index.map do |word, index|
#   index == 0 ? word.downcase : word.capitalize
# end.join
