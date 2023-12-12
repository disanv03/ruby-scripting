# Responding to calls to undefined methods
# Problem:
# Rather than having Ruby raise a NoMethodError when someone calls an undefined method
# on an instance of your class, you want to intercept the method call and do something
# else with it.
# Or you are faced with having to explicitly define a larger (possibly infinte) number of
# methods for a class. You would rather define a single method that can respond to an 
# infinite number of method name.

class MyClass
  def defined_method
    'This method is defined.'
  end

  def method_missing(m, *args)
    "Sorry, I don't know about any #{m} method."
  end
end

o = MyClass.new
o.defined_method
o.undefined_method # => "Sorry, I don't know about any undefined_method method."

class Integer
  def method_missing(m, *args)
    if args.size > 0
      raise ArgumentError.new("wrong number of arguments (#{args.size} for 0)")
    end
    match = /^plus_([0-9]+)$/.match(m.to_s)
    if match
      self + match.captures[0].to_i
    else
      raise NoMethodError.new("undefined method '#{m}' for #{inspect}:#{self.class}")
    end
  end
end

p 4.plus_5
p 10.plus_0
p -1.plus_2
p 100.plus_10000

p 20.send(:plus_25)
# 100.minus_3 # NoMethodError: undefined method 'minus_3' for 100:Fixnum
# 100.plus_5(105)
# ArgumentError: wrong number of arguments (1 for 0)

class BackwardsString
  def initialize(s)
    @s = s
  end

  def method_missing(m, *args, &block)
    if @s.respond_to?(m)
      result = @s.send(m, *args, &block)
      result.is_a?(String) ? BackwardsString.new(result) : result
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private=false)
    @s.respond_to?(method_name) || super
  end

  def to_s
    @s.reverse
  end

  def inspect
    to_s
  end
end

p s = BackwardsString.new("I'm backwards.")
p s.size
p s.upcase
p s.reverse
# p s.no_such_method

class Library < Array
  def add_book(author, title)
    self << [author, title]
  end

  def search_by_author(key)
    reject { |b| !match(b, 0, key) }
  end

  def search_by_author_or_title(key)
    reject { |b| !match(b, 0, key) && !match(b, 1, key) }
  end
  
  :private
  def match(b, index, key)
    b[index].index(key) != nil
  end
end

l = Library.new
l.add_book("James Joyce", "Ulysses")
l.add_book("James Joyce", "Finnegans Wake")
l.add_book("John le Carre", "The Little Drumer Boy")
l.add_book("John Rawls", "A Theroy of Justice")

p l.search_by_author("John")

p l.search_by_author_or_title("oy")

class Library
  def method_missing(m, *args)
    search_by_author_or_title(m.to_s)
  end
end

p l.oy
p l.Fin
p l.Jo

class StringFactory
  def StringFactory.method_missing(m, *args)
    return String.new(m.to_s, *args)
  end
end

p StringFactory.a_string
p StringFactory.another_string
StringFactory.superclass

25.respond_to? :plus_20

class Fixnum
  def respond_to?(m)
    super or (m.to_s =~ /^plus_([0-9]+)$/) != nil
  end
end

p 25.respond_to? :plus_20
p 25.respond_to? :succ
p 25.respond_to? :minus_20
