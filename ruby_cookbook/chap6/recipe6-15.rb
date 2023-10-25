# Pretending a string is a file
# Problem:
# You want to call code that expects to read from an open file object,
# but your source is a string in memory.
# Alternatively, you want to call code that writes its output to a file,
# but have it actually write to a string.

require 'stringio'
s = StringIO.new %{I am the very model of a modern major general.
                  I've information vegetable, animal, and mineral.}
p s.pos
s.each_line { |x| puts x }
p s.eof?
p s.pos
p s.rewind
p s.pos
p s.grep /general/

s = StringIO.new
p s.write('Treat it like a file.')
p s.rewind
p s.write("Act like it's")
p s.string

require 'yaml'
s = StringIO.new
YAML.dump(['A list of', 3, :items], s)
puts s.string

def make_more_interesting(io)
  io << "... OF DOOM!"
end

p make_more_interesting("Cherry pie")
open('interesting_things', 'w') do |f|
  f.write("Nightstand")
  make_more_interesting(f)
end

p open('interesting_things') { |f| f.read }

poem = %{The boy stood on the burning deck
         Whence all but he had fled
         He'd stayed above the wash his neck
         Before he went to bed}

# Write the poem to a file
output = File.open("poem", "w")
output.write(poem)
output.close

# Read the poem from the file
input = File.open("poem")


p poem.lines.select { |line| line =~ /ed$/ }
p input.each_line.select { |line| line =~ /ed$/ }

p input.grep /ed$/
input.rewind
p input.grep /ed$/

def fifth_byte(file)
  file.seek(5)
  file.read(1)
end

# p fifth_byte("123456") # => NoMethodError
p fifth_byte(StringIO.new("123456"))
