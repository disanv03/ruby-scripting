# Checking a Credit Card Checksum
# Problem:
# You want to know whether a credit card number was entered correctly


require 'rubygems'
require 'creditcard'

puts '5276 4400 6542 1319'.creditcard?
puts '5276440065421313'.creditcard?
puts 1276440065421319.creditcard?

puts 5276440065421313.creditcard_type

# Implement checksum digit of a credit card

module CreditCard
  def creditcard?
    numbers = self.to_s.gsub(/[^\d]+/, '').split(//)
    checksum = 0
    0.upto numbers.length do |i|
      weight = numbers[-1* (i+2)].to_i * (2 - (i%2))
      checksum += weight % 9
    end
    return numbers[-1].to_i == 10 - checksum % 10
  end
end

class String
  include CreditCard
end

class Integer
  include CreditCard
end

puts '5276 4400 6542 1319'.creditcard?

