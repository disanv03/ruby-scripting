# Handling International Encodings

string = "\xef\xbc\xa1" + "\xef\xbc\xa2" + "\xef\xbc\xa3" + "\xef\xbc\xa4" + "\xef\xbc\xa5" + "\xef\xbc\xa6"

puts string.bytesize
puts string.size

# size return the number of charaters in the string
# bytesize return the number of byte used to represent the string in memory

# ñ exemple (U+00F1)
# In hexadecimal 0xC3, 0xB1
n = "\xC3\xB1"

puts n.bytesize
puts n.size

