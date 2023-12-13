# Avoiding Boilerplate code with Metaprogramming
# Problem:
# You've got to type in a lot of repetitive code that a trained monkey
# could write. You're resentful at having to do this yourself, and angry
# that the repetitive code will clutter up your class listings.

class Fetcher
  def fetch(how_many)
    puts "Fetching #{how_many ? how_many : "all"}."
  end

  def fetch_one
    fetch(1)
  end

  def fetch_ten
    fetch(10)
  end

  def fetch_all
    fetch(nil)
  end
end

class GeneratedFetcher
  def fetch(how_many)
    puts "Fetching #{how_many ? how_many : "all"}."
  end

  [["one", 1], ["ten", 10], ["all", nil]].each do |name, number|
    define_method("fetch_#{name}") do
      fetch(number)
    end
  end
end

class Numeric
  [["add", "+"], ["subtract", "-"], ["multiplu", "*"], ["divide", "/"]]
    .each do |method, operator|
      define_method("#{method}_2") do
        method(operator).call(2)
      end
    end
end

p 4.add_2
p 10.divide_2

define_method "call_with_args" do |*args, &block|
  block.call(*args)
end

p call_with_args(1,2) { |n1, n2| n1 + n2 }
p call_with_args("mammoth") { |x| x.upcase }
