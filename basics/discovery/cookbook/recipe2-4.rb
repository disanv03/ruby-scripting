# Representing Rational Numbers

puts float = 2.0/3.0
puts float * 100
puts float * 100 / 42

require 'rational'
rational = Rational(2,3)
puts rational.to_f
puts rational * 100
puts rational * 100 / 42
