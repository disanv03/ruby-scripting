# Creating and Invoking a Block
# Problem:
# You want to put some Ruby code into an object so you can pass it
# around and call it later.

# Wrong way
# aBlock = { |x| puts x }
# SyntaxError: compile error

aBlock = lambda { |x| puts x }
aBlock.call "Hello World!"

# The ability to assign a bit of ruby code to a variable is very powerful.
# It lets you write general frameworks and plug in specific pieces of code
# at the crucial points

# You can accept a block as an argument to a method by prepending & to the argument name.

def my_lambda(&aBlock)
  aBlock
end

b = my_lambda { puts "Hello World My Way!" }
b.call
# When you pass a block to a method in Ruby with & it converts the block into a Proc object
p b.class

# These three lines of code are nearly equivalent
aBlock = Proc.new { |x| puts x }
aBlock = proc { |x| puts x }
aBlock = lambda { |x| puts x }

# Kernel#lambda is the preferred way of creating block object, because it gives you block
# object that act more like Ruby methods.

add_lambda = lambda { |x,y| x + y }
# add_lambda.call(4)
# ArgumentError: wrong number of arguments (1 for 2)
# add_lambda.call(4,5,6)
# ArgumentError: wrong number of arguments (3 for 2)

# A block created with lambda acts like a Ruby method. If you don't specify the right
# number of arguments, you can't call the block. But a block created with Proc.new acts
# like the anonymous code block you pass into a method like Enumerable#each:
add_procnew = Proc.new { |x,y| x + y }
# add_procnew.call(4)
# TypeError: nil can't be coerced into Fixnum
p add_procnew.call(4,5,6)                        
