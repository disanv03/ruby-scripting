# Delegating Method Calls to Another Object
# Problem:
# You'd like to delegate some of an object's method calls to a different object, or make one
# object capable of "impresonating" another.


require 'delegate'
require 'forwardable'

class OrdinalNumber < DelegateClass(Fixnum)
  def to_s
    delegate_s = __getobj__.to_s
    check = abs
    if check == 11 or check == 12
      suffix = "th"
    else
      case check % 10
      when 1 then suffix = "st"
      when 2 then suffix = "nd"
      else suffix = "th"
        end
    end
    return delegate_s + suffix
  end
end

# Testing
puts OrdinalNumber.new(4).to_s                    # => "4th"
puts OrdinalNumber.new(102).to_s                  # => "102nd"
puts OrdinalNumber.new(11).to_s                   # => "11th"
puts OrdinalNumber.new(-21).to_s                  # => "-21st"
puts OrdinalNumber.new(5).succ                    # => 6
puts OrdinalNumber.new(5) + 6                     # => 11
puts OrdinalNumber.new(5) + OrdinalNumber.new(6)  # => 11

class AppendOnlyArray
  extend Forwardable
  def initialize
     @array = []
  end
  def_delegator :@array, :<<
end

class RandomAccessHash
  extend Forwardable
  def initialize
    @delegate_to = {}
  end
  def_delegators :@delegate_to, :[], "[]="
end

balances_by_account_number = RandomAccessHash.new
balances_by_account_number['101240A'] = 412.60
balances_by_account_number['104918J'] = 10339.94
balances_by_account_number['108826N'] = 293.01

# Random acces works if you know the key, but anything else is forbidden
p balances_by_account_number['104918J']

#balances_by_account_number.each do |number, balance|
#  puts "I now know the balance for account #{number}: it's #{balance}"
#end
# => NoMethodError: undefined method 'each' for ...
