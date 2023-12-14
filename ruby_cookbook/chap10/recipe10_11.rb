# Metaprogramming with String Evaluations
# Problem:
# You're trying to write some metaprogramming code using define_method,
# but there's too much reflection going on for your code to be readable.
# It gets confusing and is almost as frustating as having to write out
# the code in longhand.


class Numeric
  [['add', '+'], ['subtract', '-'], ['multiply', '*'], ['divide', '/']].each do |method, operator|
    define_method("#{method}_2") do
      method(operator).call(2)
    end
  end
end

class Numeric
  [['add', '+'], ['subtract', '-'], ['multiply', '*'], ['divide', '/']].each do |method, operator|
    module_eval %{ def #{method}_2
                      self.#{operator}(2)
                   end }
  end
end

p 4.add_2
p 10.divide_2

class String
  def last(n)
    self[-n, n]
  end
end

p "Here's a string.".last(7)

class String
  define_method('last') do |n|
    self[-n, n]
  end
end

p "Here's a string.".last(7)

class String
  module_eval %{def last(n)
                  self[-n, n]
                end}
end

p "Here's a string.".last(7)
String.module_eval %{def last(n)
                        self[-n, n]
                     end}

p "Here's a string.".last(7)
