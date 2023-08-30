# Reversing a String by Words or Characters

s = ".sdrawkcab si gnirts sihT"
puts s.reverse


s = "order. wrong the in are words These"
puts s.split(/(\s+)/).reverse.join('')

s2 = "another try"

# String#split method takes a regular expression to use as a separator. Each time the separator matches part of the string, the portion of the string before the separator goes into a list.
# 

puts "Three little words".split(/\s+/)
puts "Three little words".split(/(\s+)/)

# Because the regular expression /(\s+)/ includes a set of parentheses, the separator string themselves are included in the
# returned list.
