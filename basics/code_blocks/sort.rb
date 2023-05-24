###############################
# Comparison Operator
###############################
# sort methods use the comparison operator
# <=>
# "spaceship operator"
# value1 <=> value2, 
# return value: -1 less than,  0 equal, 1 more than
# move to: -1 left, 0 stay, 1 right

array = [5,8,2,6,1,3]
array.sort
array.sort {|v1,v2| v1 <=> v2 }
array.sort {|v1,v2| v2 <=> v1 } # reverse

fruits = ['apple', 'banana', 'pear']
fruits.sort
fruits.sort do |fruit1, fruit2|
    fruit1.length <=> fruit2.length
end

fruits.sort_by {|fruit| fruit.length}


