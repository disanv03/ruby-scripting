# Comparing Floating Point Numbers

puts 1.8 + 0.1
puts 1.8 + 0.1 == 1.9
puts 1.8 + 0.1 > 1.9

# In math, epsilon is often used to represent a small positive quantity, especially for proofs involving limits.

class Float
  def approx(other, relative_epsilon=Float::EPSILON, epsilon=Float::EPSILON)
    difference = other - self
    return true if difference.abs <= epsilon
    relative_error = (difference / (self > other ? self : other)).abs
    return relative_error <= relative_epsilon
  end
end

100.2.approx(100.1 + 0.1)
10e10.approx(10e10+1e-5)
100.0.approx(100+1e-5)
