def plus_douze(start, stop)
  x = start
  i = 0
  until x > stop
    yield x, i
    x += 12
    i += 1
  end
end

plus_douze(0, 360) { |x, i| puts "Iterations #{i}: #{x} " }


# without yield statement
#
#  def plus_douze(start, stop)
#   x = start
#   i = 0
#   until x > stop
#     puts "Iteration #{i}: #{x}"
#     x += 12
#     i += 1
#   end
#  end
#


