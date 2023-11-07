# Chapter 7: Code Blocks and Iteration

[1,2,3].each { |i| puts i }

[1,2,3].each do |i|
  if i % 2 == 0
    puts "#{i} is even."
  else
    puts "#{i} is odd."
  end
end

1.upto 3 do |x|
  puts x
end

1.upto(3) { |x| puts x }

hello = lambda { "Hello" }
p hello.call

log = lambda { |str| puts "[LOG] #{str}" }
p log.call("A test log message.")

{1=>2, 2=>4}.each { |k,v| puts "Key #{k}, value #{v}" }

# Factory methods
# return values are customized pieces of executable code.

# lambda instantiate a code block as a Proc object
# Proc: a proc object is a block of code that can be stored in a variable
def times_n(n)
  lambda { |x| x * n }
end

times_ten = times_n(10)
p times_ten.call(5)
p times_ten.call(1.25)

circumference = times_n(2*Math::PI)
p circumference.call(10)
p circumference.call(3)

# &circumference converts the circumference Proc into a block
p [1,2,3].collect(&circumference)

ceiling = 50
[1, 10, 49, 50.1, 200].select { |x| x < ceiling }

# Definition:
# A closure in programming is a function that "closes over" its environment.
# This means the function can remenber and access the variables from the place
# where is was originally defined, even if it is executed in a different scope.
