# Redirecting Std Input or Output
# Problem:
# You don't want the standard input, output, or error of your process
# to go to the default IO object set up by the ruby interpreter.
# You want them to go to other filetype objects of your own choosing.

require 'stringio'
new_stdout = StringIO.new

$stdout = new_stdout
puts "Hello, hello."
puts "I'm writing to standard output."

$stderr.puts "#{new_stdout.size} bytes written to standard output so for."
$stderr.puts "You haven't seen anything on the screen yet, but you soon will:"
$stderr.puts new_stdout.string

# Original input and output streams for a process are always available
# as the constants STDIN, STDOUT, STDERR
