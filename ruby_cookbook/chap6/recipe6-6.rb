# Reading the contents of a file
# Problem:
# You want to read some or all of a file into memory

# Kernel#open
# For reading entire file into a single string, IO#read

# Puts some stuff into a file
open('sample_file', 'w') do |f|
  f.write("This is line one.\n This is line two.")
end

# Then read it back out
p open('sample_file') { |f| f.read }

open('sample_file').each { |x| p x }

# Process the file one chunk at a time
# puts open('conclusion') { |f| f.read(50) }

open('end_separated_record', 'w') do |f|
  f << %{This is record one.
  It spans multiple lines.ENDThis is record tow.END}
end

open('end_separated_record') { |f| f.each('END') { |record| p record } }

open('pipe_separated_records', 'w') do |f|
  f << "This is record one.|This is record two.|This is record three."
end

p open('pipe_separated_records') { |f| f.readlines('|') }


open('newline_separated_records', 'w') do |f|
  f.puts 'This is record one. It cannot span multiple lines.'
  f.puts 'This is record two.'
end

open('newline_separated_records') { |f| f.each { |x| p x } }

# The trouble with newlines is that different os have different newline formats.
# open('file_from_unknown_os') { |f| f.read.split(/\r?\n|\r(?!\n)/) }

# Use String#chomp to strip the last character set thaat can be construed as a newline
p "This line has a Unix/Mac OS X newline.\n".chomp
p "This line has a Windows newline.\r\n".chomp
p "This line has a old-style Macintosh newline.\r".chomp
p "This string contains two newline.\n\n".chomp
p "This is record two.END".chomp('END')
p "This string contains no newline.".chomp

open('pipe_separated_records') do |f|
  f.each('|') { |l| puts l.chomp('|') }
end

lines = open('pipe_separated_records') { |f| f.readlines('|') }
lines.each { |l| l.chomp!('|') }

class File
  def each_chunk(chunk_size=1024)
    yield read(chunk_size) until eof?
  end
end

open("pipe_separated_records") do |f|
  f.each_chunk(15) { |chunk| puts chunk }
end
