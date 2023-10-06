# Reversing an Array
# Prolem:
# Your array is the wrong way around: the last item should be first and the first should be last

puts [1, 2, 3].reverse
puts [1, [2, 3, 4], 5].reverse

a = [1, 2, 3]
a.reverse!
puts a
