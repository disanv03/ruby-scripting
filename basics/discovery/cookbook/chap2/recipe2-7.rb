# Taking Logarithms

# log2(4) = 2
# "To what power should we raise 2 to get 4 ?"

# Natural logarithm, base E = 2.71828
# Mathematical notation ln(x). n stand for natural
puts Math.log(1)
puts Math.log(Math::E)
puts Math.log(10)
puts Math::E ** Math.log(25)

# Common logarithm which use base 10
puts Math.log10(1)
puts Math.log10(10)
puts Math.log10(10.1)
puts Math.log10(1000)
puts 10 ** Math.log10(25)

# Calculate logarithm in some other base
# logb1(x) = logb2(x) / logb2(k)

module Math
  def Math.logb(num, base)
    log(num) / log(base)
  end
end
