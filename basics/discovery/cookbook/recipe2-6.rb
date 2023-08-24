# Converting Between Numeric Bases

puts 0b100 # => binary
puts 0o100 # => octal
puts 0x100 # => hexadecimal

puts "1045".to_i(10)
puts "-1001001".to_i(2)
puts "abc".to_i(16)
puts "abc".to_i(20)
puts "number".to_i(36)
puts "zz1z".to_i(36)
puts "abcdef".to_i(16)
puts "AbCdEf".to_i(16)

puts 42.to_s(10)
puts -100.to_s(2)
puts 255.to_s(16)
puts 1442151747.to_s(36)




