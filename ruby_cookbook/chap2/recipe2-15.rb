# Generating a Sequence of Numbers
# Problem:
# You want to iterate over a (possible infinite) sequence of numbers the way you can
# iterate over an array or a range

def fibonacci(limit = nil)
  seed1 = 0
  seed2 = 1
  while not limit or seed2 <= limit
    yield seed2
    seed1, seed2 = seed2, seed1 + seed2
  end
end

fibonacci(3)  { |x| puts x }


class Range
  def each_slow
    x = self.begin
    while x <= self.end
      yield x
      x = x.succ
    end
  end
end

(1..3).each_slow { |x| puts x }

class Integer
  def double_upto(stop)
    x = self
    until x > stop
      yield x
      x = x * 2
    end
  end
end

10.double_upto(50) { |x| puts x }

1.5.step(2.0, 0.25) { |x| puts x }
