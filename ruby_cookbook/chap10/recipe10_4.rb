# Getting a reference to a method
# Problem:
# You want to get the name of a method into a reference to the method itself

s = 'a string'
p length_method = s.method(:length)
p length_method.arity
p length_method.call

1.succ # => 2
1.method(:succ).call # => 2

5.method('+').call(10) # => 15
[1,2,3].method(:each).call { |x| puts x }
# 1
# 2
# 3

class EventSpawner
  def initialize
    @listeners = []
    @state = 0
  end

  def subsribe(&listener)
    @listeners << listener
  end

  def change_state(new_state)
     @listeners.each { |l| l.call(@state, new_state) }
     @state = new_state
  end
end

class EventListener
  def hear(old_state, new_state)
    puts "Method triggered: state change from #{old_state} " + 
      "to #{new_state}."
  end
end

spawner = EventSpawner.new
spawner.subscribe do |old_state, new_state|
  puts "Block triggered: state changed from #{old_state} to #{new_state}."
end

spawner.subscribe &EventListener.new.method(:hear)
spawner.change_state(4)

# A method can also be used as a block:
s = "sample string"
replacements = { "a" => "i", "tring" => "ubstitution" }
replacements.collect(&s.method(:gsub))
# => ["simple string", "sample substitution"]

class Welcomer
  def Welcomer.a_class_method
    return "Greetings from the Welcomer class."
  end
  
  def an_instance_method
    return "Salutations from a welcomer object."
  end
end

Welcomer.method("an_instance_method")
# NameError
Welcomer.new.method("an_instance_method").call
# => "Salutations..."
Welcomer.method("a_class_method").call
# => "Greetings..."
