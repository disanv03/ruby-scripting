#########################################
# Inject
#########################################
#
#
#

(1..4).inject(:+) => 10
# the inject method is used to accumulate a value across the 
# elements of the collection (in this case, the Range)

# start accumulation with an initial value of 0 with inject(0)

numbers = [1,2,3,4,5]
sum = numbers.inject(0) do |accumulator, number|
  accumulator + number
end

puts sum # => '15'

sum = numbers.inject(0, :+) # => '15'



def unary_sum(n)
    # Generate a list of unary numbers from 1 to n
    unary_numbers = (1..n).map { |i| '1' * i }

    # Sum all unary numbers
    sum = unary_numbers.inject(0) { |sum, unary| sum + unary.length }

    # Convert the sum back to unary
    return '1' * sum
end
