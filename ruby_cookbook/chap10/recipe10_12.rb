# Evaluating code in an earlier context
# Problem:
# You've written a method that evaluates a string as Ruby code.
# But whenever anyone calls the method, the objects referenced by your
# string go out of scope. Your string can't be evaluated within a method.

def borken_print_variable(var_name)
  eval %{puts "The value of #{var_name} is " + #{var_name}.to_s}
end

tin_snips = 5
# borken_print_variable('tin_snips')
var_name = 'tin_snips'
eval %{puts "The value of #{var_name} is " + #{var_name}.to_s}

def print_variable(var_name, binding)
  eval %{puts "The value of #{var_name} is " + #{var_name}.to_s}, binding
end

vice_grips = 10
print_variable('vice_grips', binding)
# The value of vice_grips is 10

# A binding object is a bookmark of the Ruby interpreter's state. It tracks
# the values of any local variables you have defined, whether your are inside
# a class or method definition, and so on.
