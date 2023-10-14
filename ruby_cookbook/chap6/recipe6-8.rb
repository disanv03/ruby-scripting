# Writing to a temporary file
# Problem:
# You want to write data to a secure temporary file with
# a unique name.

require 'tempfile'
out = Tempfile.new("tempfile")
p out.path

out << "Some text"
out.rewind
p out.read
out.close

# If you want the data to live longer, copy or move the temp file
require 'fileutils'
FileUtils.mv(out.path, "./")