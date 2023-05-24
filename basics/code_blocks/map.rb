##############################
# Map methods
##############################
# map / collect
# Iterate through an enumerable
# Execute a code block on each item
# Add the result of the block to a new array
# Number of items in = Number of items out
# Map always return an array of the results

x = [1,2,3,4,5]
y = x.map {|n| n + 1 } # => [2,3,4,5,6]

# map! / collect !
# Ruby often adds "!" to indicate a more powerful or destructive version of a method
# works the same but replaces array contents

fruits = ['apple', 'banana', 'pear']
cap_fruits = fruits.map do |fruit|
             fruit.capitalize if fruit == 'pear'
end # => [nil, nil, "Pear"]

cap_fruits = fruits.map do |fruit|
    fruit == 'pear' ? fruit.capitalize : fruit
end # => ['apple', 'banana', 'Pear']
