# in order to be accessible from within the check_voter function
# voted has to be an instance variable (or global / class)
# In ruby, when you're running code in the top-level context
# (note inside any class or module definiton), you're actually executing code
# in the context of an object called 'main', which is an instance of 'Object'.

@voted = {}

def check_voter(name)
  if @voted[name]
    puts "kick them out"
  else
    @voted[name] = true
    puts "let them vote!"
  end
end

check_voter("tom")
check_voter("mike")
check_voter("mike")

