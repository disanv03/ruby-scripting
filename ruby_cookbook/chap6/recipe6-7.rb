# Writing to a file
# Problem:
# You want to write some text or Ruby data structure to a file.
# The file might or might not exist. If it does exist, you might 
# want to overwrite the old contents, or just append new data to the end of the file.

open('output', 'w') { |f| f << "This file contains great truths.\n" }
open('output', 'w') do |f|
  f.puts 'The great truths have been overwritten with an advertisement'
end

open('output') { |f| f.read }

# Append with "a"

open('output', "a") { |f| f.puts "Buy MORE COFFEE" }
open('output') { |f| puts f.read }

open('output', 'w') do |f|
  [1,2,3].each_with_index { |i, index| f << i.to_s << (index == 2 ? '' : ' and a ') }
end

open('output') { |f| puts f.read }

# flush ruby buffer

open('output', 'w') do |f|
  f << 'This is giong into the ruby buffer.'
  f.flush # Now it's going into the OS buffer
end

open('output', 'w') do |f| 
  f.sync = true
  f << 'This is going straight into the os buffer.'
end
