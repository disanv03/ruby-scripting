# Ignoring Case when sortings Strings
# Problem:
# When you sort a list of strings, the strings beginning with uppercase letters sort 
# before the strings beginning with lowercase letters.
# You want an alphabetical sort, regardless of case.

list = ["Albania", "anteater", "zorilla", "Zaire"]
puts list.sort

puts list.sort_by { |x| x.downcase }

# The Array#sort_by uses a technique called a Schwartizian Transform.
# This common technique is like writing the following Ruby code
list.collect { |s| [s.downcase, s] }.sort.collect{ |subarray| subarray[1] }

# Implement Schwartizan Transform in Ruby

m = {}
list.sort { |x,y| (m[x] ||= x.downcase) <=> (m[y] ||= y.downcase) }
