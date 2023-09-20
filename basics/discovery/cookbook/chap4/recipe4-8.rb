# Summing the items of an Array
# Problem:
# You want to add together many objects in an array


collection = [1, 2, 3, 4, 5]
sum = 0
collection.each { |i| sum += i }
puts sum

# However this is such a common action that Ruby has a special iterator
# method called inject, which saves a little code:

collection = [1, 2, 3, 4, 5]
collection.inject(0) {|sum, i| sum + i }

collection = [1, 2, 3, 4, 5]
collection.inject(1) { |total, i| total * i }


