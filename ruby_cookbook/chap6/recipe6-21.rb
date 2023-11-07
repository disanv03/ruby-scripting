# Finding and Changing the current working directory
# Problem:
# You want to see which directory the ruby process considers its current working directory,
# or change that directory.

p Dir.getwd # for get working directory

Dir.chdir("/bin")
p Dir.getwd
p File.exist? "ls"
