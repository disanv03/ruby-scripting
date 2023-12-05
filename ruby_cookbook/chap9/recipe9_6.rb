# Automatically Loading Libraries as needed
# Problem:
# You've written a big library with multiple components. You'd like to split
# it up so that users don't have to load the entire library into memory
# just to use part of it. But you don't want to make your users explicitly
# require each part of the library they plan to use.

# functions.rb
module Decidable
  # ... Many, many methods go here.
end

module SemiDecidable
  # ... Many, many methods go here.
end

# You can provide the same interface, but possibly save your users some
# memory, by splitting functions.rb into three files. The functions.rb file
# itself becomes a stub full of autoload calls.

# functions.rb
autoload :Decidable, "decidable.rb"
autoload :Semidecidable, "semidecidable.rb"

# decidable.rb
module Decidable
  # ... Many, many methods go here.
end

# semidecidable.rb
module SemiDecidable
  # ... Many, many methods go here.
end

require 'functions'
Decidable.class

#
#
#

autoload :Set, "set.rb"

def random_set(size)
  max = size * 10
  set = Set.new
  set << rand(max) until set.size == size
  return set
end

# more code goes here

random_set(10) # => #<Set: {39, 83, 73, 40, 90, 25, 91, 31, 76, 54}>
require 'set' # => false
