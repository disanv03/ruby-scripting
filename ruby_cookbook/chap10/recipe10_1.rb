# Finding an Object's class and superclass
# Problem:
# Given a class, you want an object corresponding to its class, or to
# the parent of its class.

p 'a string'.class
p 'a string'.class.name
p 'a string'.class.superclass
p String.superclass
p String.class
p String.class.superclass
p 'a string'.class.new

class Class
  def hierarchy
    (superclass ? superclass.hierarchy : []) << self
  end
end

p Array.hierarchy

class MyArray < Array
end

p MyArray.hierarchy

p String.superclass
p String.ancestors
p Array.ancestors
p MyArray.ancestors
p Object.ancestors

class MyClass
end

p MyClass.ancestors
