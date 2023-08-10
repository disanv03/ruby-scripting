# Processing a String One character at a Time

'foobar'.each_byte { |x| puts "#{x} = #{x.chr}" }

# To yield each character of a string as a new one

'foobar'.scan(/./) { |c| puts c }


# String#each is used to split a string on a given separator (by default the newline)

"foo\nbar".each_line { |x| puts x }


french = "\xc3\xa7a va"

french.scan(/./) { |c| puts c }

puts french.encoding
