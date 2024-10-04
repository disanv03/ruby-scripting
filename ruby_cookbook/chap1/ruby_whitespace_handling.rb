# Managing Whitespace

# use strip to remove whitespace

puts " \tWhitespace at beginning and end. \t\n\n".strip

s = "Some text."
puts s.center(15)
puts s.ljust(15)
puts s.rjust(15)

# Transform Windows-style newlines to Unux-style newlines

puts "Line one\r\nLine two\r\n".gsub("\r\n", "\n")

# regex pattern \s for space
