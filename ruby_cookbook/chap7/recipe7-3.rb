# Binding a Block argument to a variable
# Problem:
# You've written a method that takes a code block, but it's not enough
# for you to simply call the block with yield. You need to somehow bind
# the code block to a variable, so you can manipulate the block directly.
# Most likely, you need to pass it as the code block to another method.

def repeat(n)
  n.times { yield } if block_given?
end
repeat(2) { puts "Hello." }

def repeat(n, &block)
  n.times { block.call } if block
end
repeat(2) { puts "Hello." }

def repeat(n, &block)
  n.times { yield } if block
end
repeat(2) { puts "Hello." }

def biggest(collection, &block)
  block ? collection.select(&block).max : collection.max
end

array = [1, 2, 3, 4, 5]
p biggest(array) {|i| i < 3}
p biggest(array) {|i| i != 5}
p biggest(array)

def pick_random_numbers(min, max, limit)
  limit.times { yield min+rand(max+1) }
end

def lottery_style_numbers(&block)
  pick_random_numbers(1, 49, 6, &block)
end

lottery_style_numbers { |n| puts "Lucky number: #{n}" }

def invoke_on_each(*args, &block)
  args.each { |arg| yield arg }
end

invoke_on_each(1,2,3,4) { |x| puts x ** 2 }
