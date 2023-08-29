# Solving a System of Linear Equations
# = Equation that produces a straight line when graphed

# 2x + 10y + 8z = 54
# 7y + 4z = 30
# 5x + 5y + 5z = 35

# To solve these equations, create the two matrices

require 'matrix'
require 'rational'

coefficients = [[2,10,8], [0,7,4], [5,5,5]].collect! do |row|
  row.collect! { |x| Rational(x) }
end

coefficients = Matrix[*coefficients]

constants = Matrix[[Rational(54)], [Rational(30)], [Rational(35)]]

solutions = coefficients.inverse * constants
puts solutions

# info note:
# "reciprocal" and "multiplicative inverse" are often used ase the same.
 result1 = 10 / 2
 puts result1 #=> 5

 reciprocal_of_2 = 1.0 / 2
 result2 = 10 * reciprocal_of_2
 puts result2 #=> 5
