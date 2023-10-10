# Checking to see if a file exists
# Problem:
# Given filename, you want to see whether the corresponding file exists
# and is the right king for your purposes

# File.file? returns true only if the file is an existing regular file
# (not a directory, a socket, or some other special file)

filename = 'a_file.txt'
p File.file? filename

require 'fileutils'
FileUtils.touch(filename)
p File.file? filename

# File.exists? return true if a file of the given name exists, no matter 
# what kind of file it is.

directory_name = 'a_directory'
# FileUtils.mkdir(directory_name)
p File.file? directory_name
p File.exists? directory_name

# Checking the type of file File.directory?

p File.directory? directory_name
p File.directory? filename

# For UNIX systems

p File.blockdev? '/dev/hda1'
p File.chardev? '/dev/tty1'
p File.socket? '/var/run/mysqld/mysqld.sock'
system('mkfifo named_pipe')
p File.pipe? 'named_pipe'

new_filename = "#{filename}2"
File.symlink(filename, new_filename)

p File.symlink? new_filename
p File.file? new_filename
