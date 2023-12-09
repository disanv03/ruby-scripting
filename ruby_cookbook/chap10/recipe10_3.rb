# Listing Methods unique to an object
# Problem:
# When you list the methods available to an object, the list is cluttered
# with extraneous methods defined in the object's superclasses and mixed
# in modules. You want to see a list of only the methods defined by that
# object's direct class.

class Object
  def my_methods_only
    my_super = self.class.superclass
    return my_super ? methods - my_super.instance_methods : methods
  end
end

s = ''
s.methods.size
Object.instance_methods.size
s.my_methods_only.size
(s.methods - Object.instance_methods).size

def s.singleton_method()
end

s.methods.size
s.my_methods_only.size

class Object
  def new_object_method
  end
end

class Object
  def new_object_method
  end
end

s.methods.size
s.my_methods_only.size

class MyString < String
  def my_string_methods
  end
end

MyString.new.my_methods_only

class Object
  def my_methods_only_no_mixins
    self.class.ancestors.inject(methods) do |mlist, ancestor|
      mlist = mlist - ancestor.instance_methods unless ancestor.is_a? Class
      mlist
    end
  end
end

[].methods.size
[].my_methods_only.size
[].my_methods_only_no_mixins.size
