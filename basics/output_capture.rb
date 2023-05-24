require 'date'

# Get the current directory
current_directory = Dir.pwd

# run the 'dir' command
output = `dir "#{current_directory}"`

# get the current time
time = Time.now.strftime("%d/%m/%Y %H:%M")

# open the log file in append mode
File.open('log.txt', 'a') do |file|
  #write the time, command, and output to the log file
  file.puts("#{time} - Running 'dir' command:")
  file.puts(output)
  file.puts() # add an extra newline for readability
end

puts "Command output logged to log.txt"

