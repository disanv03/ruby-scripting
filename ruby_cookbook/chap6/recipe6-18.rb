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


# For unempty dir use remove_dir
# Passing :secure option to rm_rf slows down deletions
# (it has to change the permissions on the directory before deleting it)
Dir.mkdir "/tmp/doomed_directory"
FileUtils.rm_rf("/tmp/doomed_directory", :secure => true)
File.exist? "/tmp/doomed_directory"

# Why isn't the :secure option the default for rm_rf ?
# Because secure deletion isn't thread-safe: i actually changes the current
# working directory of the process.
# You need to choose between thread safety and a possible security hole.

