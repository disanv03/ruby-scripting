# Checking Your acces to a file
# Problem:
# You want to see what you can do with a file: whether you have read, write,
# or (on UNIX systems) execute permission on it


# File.readable?, File.writeable?, File.executable?

p File.readable?('/bin/ls')
p File.readable?('/ect/passwd-')

filename = 'test_file'
File.open(filename, 'w') {}
p File.writable?(filename)
p File.writable?('/bin/ls')
p File.executable?('/bin/ls')
p File.executable?(filename)

p File.owned? 'test_file'
p File.grpowned? 'test_file'
p File.owned? '/bin/ls'

# UNIX permission mask 0644

p File.lstat('test_file').mode & 0777
# => 420 that is, 0644 octal

def what_can_i_do?
  sys = Process::Sys
  puts "UID=#{sys.getuid}, GID=#{sys.getgid}"
  puts "Effective UID=#{sys.geteuid}, Effective GID=#{sys.getegid}"
  
  file = '/bin/ls'
  can_do = [:readable?, :writable?, :executable?].inject([]) do |arr, method|
    arr << method if File.send(method, file) 
    arr
  end
  puts "To you, #{file} is: #{can_do.join(', ')}"
end

what_can_i_do?

Process.uid = 1000
what_can_i_do?
