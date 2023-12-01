# Implementing Class and Singletion Methods
# Problem:
# You want to associate a new method with a class (as opposed to the 
# instance of that class), or with a particular object (as opposed to other
# instances of the same class).

class Regexp

  def Regexp.is_valid?(str)
    begin
      compile(str)
      valid = true
    rescue RegexpError
      valid = false
    end
  end
end

p Regexp.is_valid? "The horror!"
p Regexp.is_valid? "The)horror!"

def Fixnum.random(min, max)
  raise ArgumentError, "min > max" if min > max
  return min + rand(max-min+1)
end

p Fixnum.random(10, 20)
p Fixnum.random(-5, 0)
p Fixnum.random(10, 10)
#Fixnum.random(20, 20) # ArgumentError: min > max

# Define a method on one particular other object, prefix the method name
# with the variable name when you define the method
company_name = 'Homegrown Software'
def company_name.legalese
  return "#{self} is a registered trademark of ConglomCo International."
end

p company_name.legalese
#'Some Other Company'.legalese # NoMethodError

# In Ruby, a singleton method is a method defined on one specific object,
# and not available to other instances of the same class.

class Button
  def pushed
  end
end

button_a = Button.new
def button_a.pushed
  puts "You pushed me! I'm offended!"
end

button_b = Button.new
def button_b.pushed
  puts "You pushed me; that's okay."
end

p Button.new.pushed
p button_a.pushed
p button_b.pushed
