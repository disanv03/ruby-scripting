#
# Factorial implementation in a recursive way
#
# A factorial, as n!, is the product of all positive integers
# less or equal to n.
#
# Ex:
# 5! = 5 x 4 x 3 x 2 x 1 = 120
#
# By definiton:
# 0! = 1

def fact(x)
  if x == 1
    1
  else
    x * fact(x - 1)
  end
end

puts fact(5)

