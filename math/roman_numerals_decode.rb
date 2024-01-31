#!/usr/bin/ruby

# visit: https://github.com/trizen/ruby-scripts, original source.
#convert roman numerals to arabic numbers.

def roman_to_arabic(roman)
  arabic = 0
  last_digit = 1000

  m = {
	I: 1,
	V: 5,
	X: 10,
	L: 50,
	C: 100,
	D: 500,
	M: 1000
  }

  for digit in (roman.chars.map {|n| m[n.to_sym] })
	if(last_digit < digit)
	  arabic -= (last_digit << 1)
	end
	  arabic += (last_digit = digit)
  end

  return arabic
end


puts roman_to_arabic("MDCLXVI") #=> 1666
puts roman_to_arabic("MMVIII") #=> 2008
puts roman_to_arabic("MCMXC") #=> 1990


# NOTE:
# Shifting a binary number to the left by 1 bit is equivalent to multiplying that number by 2.
# Remember to read and add starting from the left.
# 
# Example: (second M in "MCMXC" => 1990)
# Processing 'M' (1000) :
#    digit = 1000
#    last_digit < digit is true (100 is less than 1000)
#    arabic = 1100 - (100 << 1) = 1100 - 200 = 900
#    arabic = 900 + 1000 = 1900
#    last_digit = 1000
#
# In summary, the algorithm effectively adds the value of each Roman numeral to a total. 
# However, if a smaller numeral precedes a larger one, it subtracts double the value of the smaller numeral 
# (to correct for the previous addition and apply the necessary subtraction). 
