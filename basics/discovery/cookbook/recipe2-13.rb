# Simulating a Subclass of fixnum

require 'delegate'

class HexNumber < DelegateClass(Integer)
  # The string representations of this class are hexadecimal numbers
  def to_s
    sign = self < 0 ? "-" : ""
    hex = abs.to_s(16)
    "#{sign}0x#{hex}"
  end
  
  def inspect
    to_s
  end
end

puts HexNumber.new(10)
puts HexNumber.new(-10)
puts HexNumber.new(1000000)
puts HexNumber.new(1024 ** 10)

puts HexNumber.new(10).succ
puts HexNumber.new(10) * 2
