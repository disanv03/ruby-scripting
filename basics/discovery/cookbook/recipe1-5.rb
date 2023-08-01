# Representing Unprintable Characters

octal = "\000\001\010\020"
octal.each_byte { |x| puts x }
# 0
# 1
# 8
# 16

hexadecimal = "\x00\x01\x10\x20"
hexadecimal.each_byte { |x| puts x }
# 0
# 1
# 16
# 32


open('smiley.html', 'wb') do |f| # wb for binary writing
  f << '<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">'
  f << "\xe2\x98\xBA"
  f << "\x07"
end

puts "foo\tbar"
puts %{foo\tbar}
puts %Q{foo\tbar}

puts 'foo\tbar'
puts %q{foo\tbar}


