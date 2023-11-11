# Writing a Method That Accepts a Block
# Problem:
# You want to write a method that can accept and call an attached code block:
# a method that works like Array#each, Fixnum#upto, and other built-in Ruby methods.

def call_twice
  puts "I'm about to call your block."
  yield
  puts "I'm about to call your block again."
  yield
end

call_twice { puts "Hi, I'm a talking code block." }

def repeat(n)
  if block_given?
    n.times { yield }
  else
    raise ArgumentError.new("I can't repeat a block you don't give me!")
  end
end

repeat(4) { puts "Hello." }

def call_twice
  puts "Calling your block."
  ret1 = yield("very first")
  puts "The value of your block: #{ret1}"

  puts "Calling your block again."
  ret2 = yield("second")
  puts "The value of your block: #{ret2}"
end

call_twice do |which_time|
  puts "I'm a code block, called for the #{which_time} time."
  which_time == "very first" ? 1 : 2
end

squares = {0=> 0, 1=> 1, 2=> 4, 3=> 9}
p squares.find { |key, value| key > 1 }

class Hash
  def find_all
    new_hash = Hash.new
    each { |k,v| new_hash[k] = v if yield(k, v) }
    new_hash
  end
end

p squares.find_all { |key, value| key > 1 }

p squares.dup.delete_if { |key, value| key > 1 }
p squares.dup.delete_if { |key, value| key <= 1 }
