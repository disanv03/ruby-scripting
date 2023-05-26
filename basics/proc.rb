# Proc for procedure

square = Proc.new {|x| x ** 2}

square.call(3) # => 9
# shorthands:
square.(3) # => 9
square[3] # => 9


def gen_times(factor)
  Proc.new {|n| n*factor}
end

times3 = gen_times(3)
times5 = gen_times(5)

times3.call(12) # => 36
times5.call(5) # => 25
times3.call(times5.call(4)) # => 60

