# Truncating a file
# Problem:
# You want to truncate a file to a certain length, problably zero bytes.

filename = 'truncate.txt'
open(filename, 'w') { |f| f << "All of this will be truncated." }
p File.size(filename)

f = open(filename, 'w') {}
p File.size(filename)

open(filename, 'w') { |f| f << "Here are some new contents." }
p File.size(filename)
f = open(filename, File::TRUNC) {}
p File.size(filename)

# You can't actually do anything with a File whose access mode is File::TRUNC
#open(filename, File::TRUNC) do |f|
#  f << "At last, an empty file to write to!"
#end

f = open(filename, 'w') do |f|
  f << 'These words will remain intact after the file is truncated.'
end
File.size(filename)

File.truncate(filename, 30)
File.size(filename)
open(filename) { |f| f.read }

f = open(filename, "w") { |f| f << "Brevity is the soul of wit." }
File.size(filename)
File.truncate(filename, 30)
File.size(filename)
open(filename) { |f| f.read }

# File.truncate act like the bed of Procrustes: they force a file
# to be a certain number of bytes long, whether that means stretching it
# or chopping off the end
