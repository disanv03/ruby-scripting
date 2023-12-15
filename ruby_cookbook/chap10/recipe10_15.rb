# Doing Aspect-Oriented Programming
# Problem:
# You want to "wrap" a method with new code, so that calling the method triggers
# some new feature in addition to the original code.

# require 'aspectr'
# class Verbose < AspectR::Aspect
#   def describe(method_sym, object, *args)
#     arg_descriptions = args.map { |arg| arg.inspect rescue '...' }
#     "#{object.inspect}.#{method_sym}(#{arg_descriptions.join(",")})"
#   end
# 
#   def before(method_sym, object, return_value, *args)
#     puts "About to call #{describe(method_sym, object, *args)}."
#   end
# 
#   def after(method_sym, object, return_value, *args)
#     puts "#{describe(method_sym, object, *args)} has returned "
#     + return_value.inspect + '.'
#   end
# end
# 
# verbose = Verbose.new
# stack = []
# verbose.wrap(stack, :before, :after, :push, :pop)
# stack.push(2)
# # About to call [].push(10).
# # [10].push(10) has returned [[10]].
# 
# stack.push(1)
# # About to call [10].push(4)
# # [10, 4].push(4) has returned [[10, 4]].
# 
# stack.pop
# # About to call [10, 4].pop().
# # [10].pop() has returned [4].

# Simple Implementation of AspectR


class TestClass
  def greet(name)
    "Hello, #{name}!"
  end

  def add(a, b)
    a + b
  end
end


require 'aspectr'

class LoggingAspect < AspectR::Aspect
  def before(method, object, *args)
    puts "Before #{method}: Called with args #{args.inspect}"
  end

  def after(method, object, *args)
    puts "After #{method}: Finished with args #{args.inspect}"
  end
end


test_object = TestClass.new
logger = LoggingAspect.new

# Wrap the methods of TestClass
logger.wrap(test_object, :before, :after, :greet, :add)


test_object.greet("Alice")
test_object.add(2, 3)
