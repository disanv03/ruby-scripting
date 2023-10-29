# Processing a Binary File
# Problem:
# You want to read binary data from a file, or write it to one.

open('binary', 'wb') do |f|
  (0..100).step(10) { |b| f << b.chr }
end

s = open('binary', 'rb') { |f| f.read }

open('binary', 'rb') { |f| f.each_byte { |b| puts b } }

f = open('binary')
p f.pos
p f.read(1)
p f.pos
f.pos = 4
p f.read(2)
p f.pos

f.seek(8)
f.pos

f.seek(-4, File::SEEK_CUR)
p f.pos
f.seek(2, File::SEEK_CUR)
p f.pos

f.seek(-2, File::SEEK_END)
p f.pos

p f.read(500)
p f.pos
p f.eof?
f.close

# Simultaneous read and write with rb+
f = open('binary', 'rb+')
p f.read
p f.pos = 2
f.write('Hello.')
f.rewind
p f.read
f << 'Goodbye.'
f.rewind
p f.read
f.close
