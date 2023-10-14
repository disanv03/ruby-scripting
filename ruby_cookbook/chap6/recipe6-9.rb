# Picking a random line from a file
# Problem:
# You want to choose a random line from a file, without loading
# the entire file into memory

module Enumerable
    def random_line
        selected = nil
        each_with_index { |line, lineno| selected = line if rand < 1.0/lineno }
        return selected.chomp if selected
    end
end

# Create a file with 1000 lines
open('random_line_test', 'w') do |f|
    1000.times { |i| f.puts "Line #{i}" }
end

# Pick random lines from the file
f = open('random_line_test')
p f.random_line
p f.rewind
p f.random_line

# The obvious solution reads the entire file into memory
File.open('random_line_test') do |f|
    l = f.readlines
    l[rand(l.size)].chomp
end