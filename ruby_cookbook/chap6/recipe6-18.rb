# Deleting a File
# Problem:
# You want to delete a single file, or a whole directory tree

require 'fileutils'
FileUtils.touch "doomed_file"
p File.exist? "doomed_file"
File.delete "doomed_file"
p File.exist? "doomed_file"

# removing directory recursively with remove_dir
Dir.mkdir "doomed_directory"
p File.exist? "doomed_directory"
FileUtils.remove_dir "doomed_directory"
File.exist? "doomed_directory"
