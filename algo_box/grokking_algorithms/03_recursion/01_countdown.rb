# Prints a countdown from a given number `i` to 0. 
# After reaching 0, it print even numbers as the stack unwinds
# (returns back up the recursive calls)
#
# Output =>
# 6
# 5
# 4
# 3
# 2
# 1
# 0 => reaching the base case
# 2
# 4
# 6
#
# The main point it's to demonstrate that action can still be done
# on the way back to the recursive calls, from where it left off.
#
# Analogy to a Stack:
#
# - Each recursive call adds a new frame to the stack (a last in, first-out stucture)
# - The base case is where the recursion stops adding frames and starts removing them
# - As each call returns, it "pops" off the stack, and the function continues to execute
#   from where it left off in the previous frame.


def countdown(i)
  puts i
  
  # base case
  if i <= 0
    return # exist method immediately and return 'nil'
    
  # recusive case
  else
    countdown(i - 1)
  end
  
  # illustating the return from top pile to bottom
  # action can still be done here:
   puts i if i % 2 == 0
end

countdown(6)


