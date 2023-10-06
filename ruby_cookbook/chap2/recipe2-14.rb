# Doing Math with Roman Numbers
# Problem:
# You want to convert Arabic and Roman numbers, or do arithmetic with Roman numbers and get Roman numbers as your result.

class Roman
  @@roman_to_arabic = [['M', 1000], ['CM', 900],
                       ['D', 500], ['CD', 400],
                       ['C', 100], ['XC', 90], ['L',50], ['XL', 40],
                       ['X', 10], ['IX', 9], ['V', 5], ['IV', 4], ['I', 1]]
  @@arabic_to_roman = @@roman_to_arabic.collect { |x| x.reverse }.reverse
  MAX = 3999

  def initialize(number)
    if number.respond_to? :to_str
      @value = Roman.to_arabic(number)
    else
      Roman.assert_within_range(number)
      @value = number
    end
  end

  def Roman.assert_within_range(number)
    unless number.between?(1,MAX)
      msg = "#{number} can't be represented as a Roman number"
      raise RangeError.new(msg)
    end
  end

  def Roman.to_arabic(s)
    if s.respond_to? :to_str
      c = s.dup
      value = 0
      invalid = ArgumentError.new("Invalid Roman number: #{s}")
      @@roman_to_arabic.each do |(roman, arabic)|
        value_from_this_number = 0
        while c.index(roman) == 0
          value_from_this_number += arabic
          if value_from_this_number > arabic
            raise invalid
          end
          c = c[roman.size..-1] # Slicing from the roman size to the end of the string
        end
        value += value_from_this_number
      end
      raise invalid if c.size > 0
      return value
    end
  end


  def to_arabic
      @value
  end

  def to_roman
    value = to_arabic
    Roman.assert_within_range(value)
    repr = ""
    @@arabic_to_roman.reverse_each do |arabic, roman|
      num, value = value.divmod(arabic)
    repr << roman * num
    end
    repr
  end

  def method_missing(m, *args)
    super unless @value.respond_to?(m)
    hex_args = args.collect do |arg|
      arg.kind_of?(Roman) ? arg.to_int : arg
    end
    result = @value.send(m, *hex_args)
    return result if m == :coerce
    begin
      case result
      when Integer
        Roman.new(result)
      when Array
        result.collect do |element|
          element.kind_of?(Integer) ?
            Roman.new(element) : element
        end
      else
        result
      end
    rescue RangeError
      result
    end
  end

  def respond_to?(method_name)
    super or @value.respond_to? method_name
  end

  def to_s
    to_roman
  end
  
  def inspect
    to_s
  end
end


  class Integer
    def to_roman
      Roman.new(self)
    end
  end
  
  class String
    def to_roman
      Roman.new(self)
    end
  end

  puts 72.to_roman
  puts 444.to_roman
  puts 1979.to_roman

  puts 612.to_roman * 3.to_roman
  puts 612.to_roman * 10000
  puts 612.to_roman * 0

