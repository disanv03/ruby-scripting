# Writing a inherited class
# Problem:
# You want to create a new class that extends or modifies the behavior of an existing class.

class String
  def scramble
    split(//).sort_by { rand }.join
  end
end

p "I once was a normal string.".scramble

class UnpredictableString < String
  def scramble
    split(//).sort_by { rand }.join
  end

  def inspect
    scramble.inspect
  end
end

str = UnpredictableString.new('It was a drak and stormy night.')
p str

class Array
  def sum(start_at=0)
    inject(start_at) { |sum, x| sum + x }
  end
end

p [79, 12, 2].sum
p ['so', 'fa'].sum('')
# p [79, 'so'].sum # => TypeError: String can't be coerced into Fixnum

class NumericArray < Array
  def sum
    inject(0) { |sum, x| sum + x }
  end
end