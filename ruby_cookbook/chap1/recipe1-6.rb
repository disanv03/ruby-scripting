# Converting Between Characters and Values

# Use .ord for ordinal instead of ?
?a
# => 97
?! 
# => 33
?\n 
# => 10

a = 'choose a characters'[7]
puts "#{a.ord}"

puts "#{97.chr}"
puts "#{10.chr.inspect}"
puts "#{0.chr.inspect}"
