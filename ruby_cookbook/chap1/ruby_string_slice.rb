# Getting the parts of a string you want

s = 'My kingdom for a string!'

puts s.slice(3,7)
puts s[3,7]
puts s[0,3]
puts s[11,5]
puts s[11,17]

puts s[/.ing/]
# use * for matching the preceding element zero or more times
puts s[/str.*/]

# count from the end of the string, use negative indexes

puts s.slice(-7,3)
puts s[-7,6]

# getting the rightmost portion of a string

puts s[15...s.length]
