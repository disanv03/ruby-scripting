# Generating Prime Numbers
# Problem:
# You want to generate a sequence of prime numbers, or find all prime numbers below a certain threshold
# Prime number is a natural number greater that 1 that cannot be formed by multiplying two
# smaller natural numbers.

require 'prime'

primes = Prime.each

p primes.next
p primes.next

primes.each { |x| puts x; break if x > 15; }

# Sieve of Eratosthenes algorithm
# which finds all primes in a certain range
