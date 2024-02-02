def fact(n)
  product = 1
  while n > 1
    product *= n
    n -= 1
  end
  product
end

puts fact(5)
