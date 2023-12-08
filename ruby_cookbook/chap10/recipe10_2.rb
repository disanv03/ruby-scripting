# Listing an Object's Methods
# Problem:
# Given an unfamiliar object, you want to see what methods are available
# to call.

p Object.methods
p Object.singleton_methods
p Integer.singleton_methods

class MyClass
  def MyClass.my_singleton_methods
  end

  def my_instance_method
  end
end

p MyClass.singleton_methods

''.methods == String.instance_methods
p Object.methods.sort

# To see whether a class defines a certain instance method,
# call method_defined? on the class or respond_to? on an instance
# of the class.

MyClass.method_defined? :my_instance_method
MyClass.new.respond_to? :my_instance_method
MyClass.respond_to? :my_instance_method
MyClass.respond_to? :my_singleton_method

# IF you find yourself using respond_to? a lot in an interactive Ruby session,
# you're a good customer for irb's autocomplete feature.
# Put the following line in your .irbrc file or equivalent:

require 'irb/completion'
IRB.conf[:use_readline] = true

#

String.private_instance_methods.sort
String.new.autoload?

