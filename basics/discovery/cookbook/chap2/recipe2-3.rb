# Representing Numbers to Arbitrary Precision

require 'bigdecimal'

puts BigDecimal("10").to_s
puts BigDecimal("1000").to_s
puts BigDecimal("1000").to_s("F")
puts BigDecimal("0.123456789").to_s


nm = "0.123456789123456789123456789123456789"
puts nm.to_f
puts BigDecimal(nm).to_s

puts BigDecimal("105000").split
# => [1, "105", 10, 6]
# That is, 0.105*(10**6)

puts BigDecimal("-0.005").split
# => [-1, "5", 10, -2]
# That is, -1 * (0.5*(10**-2)

puts (BigDecimal("2") / BigDecimal("3")).to_s
puts 2.0/3



