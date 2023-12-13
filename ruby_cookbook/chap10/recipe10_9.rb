# Automatically Initializing Instance Variables
# Problem:
# You're writing a class constructor that takes a lot of arguments,
# each of which is simply assigned to an instance variable

class RGBColor
  def initialize(red=0, green=0, blue=0)
    @red = red
    @green = green
    @blue = blue
  end
end

class Object
  private
  def set_instance_variables(binding, *variables)
    variables.each do |var|
      instance_variable_set("@#{var}", eval(var.to_s, binding))
    end
  end
end

# Using this method, you can eliminate the tedious variable assignements
class RGBColor
  def initialize(red=0, green=0, blue=0)
    set_instance_variables(binding, *local_variables)
  end
end

# When a method is called, any arguments passed in are immediately bound
# to local variables. At the very beginning of the method, these are the
# only local variables defined.
class RGBColor
  def initialize(red=0, green=0, blue=0, debug=false)
    set_instance_variables(binding, *local_variables-['debug'])
    puts "Color: #{red}/#{green}/#{blue}" if debug
  end
end

p RGBColor.new(10, 200, 255, true)

