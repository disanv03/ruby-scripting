num = 90

7.times do
    puts "#{num.class}(#{num.size}): #{num}"
    num *= num
end

digits = 0..9
puts digits.include?(5)
puts digits.min()
puts digits.max()
puts digits.reject {|i| i < 5}
puts digits.each {|digit| puts (digit)}

# range checking if 5 is within range
puts (1..10) === 5 # Output: true

# exclusive range with ...
range = 1...10
puts r.max() # Output: 9
