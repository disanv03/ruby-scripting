# Matching Strings with Regular Expressions

# =~ operator tests a string against a regular expression
string = 'This is a 30-character string.'

if string =~ /([0-9]+)-character/ and $1.to_i == string.length
  puts "Yes, there are #$1 charaters in that string."
end

# with Regexp#match

match = Regexp.compile('([0-9]+)-character').match(string)
if match && match[1].to_i == string.length
  puts "Yes, there are #{match[1]} characters in that string."
end

string2 = "123"

case string2
when /^[a-zA-Z]+$/
  puts "Letters"
when /^[0-9]+$/
  puts "Numbers"
else
  puts "Mixed"
end
