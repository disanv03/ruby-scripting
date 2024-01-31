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

