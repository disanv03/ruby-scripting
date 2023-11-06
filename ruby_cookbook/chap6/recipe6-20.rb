# Finding the file you want
# Problem:
# You want to locate all the files in a directory hierarchy that match some criteria.
# For instance, you might want to find all the empty files, all the MP3 files, or
# all the files named "README."

require 'find'
module Find
  def match(*paths)
    matched = []
    find(*paths) { |path| matched << path if yield path }
    return matched
  end
  module_function :match
end

Find.match("./") { |p| File.lstat(p).size == 0 }
Find.match("./") { |p| ext = p[-4...p.size]; ext && ext.downcase == ".mp3" }
Find.match("./") { |p| File.split(p)[1] == "README" }

Find.match("./") do |p|
  Find.prune if p == "./tmp"
  File.split(p)[1] == "README"
end

# Find all files that start with a particular phrase
must_start_with = "This Ruby program"
Find.match("./") do |p|
  if File.file? p
    open(p) { |f| f.read(must_start_with.size) == must_start_with }
  else
    false
  end
end

# Finds files that were probably left behind by emacs sessions
def emacs_droppings(*paths)
  Find.match(*paths) do |p|
    (p[-1] == ?~ and p[0] != ?~) or (p[0] == ?# and p[-1] == ?#)
  end
end

def bigger_than(bytes, *paths)
  Find.match(*paths) { |p| File.lstat(p).size > bytes }
end

def modified_recently(seconds, *paths)
  time = Time.now - seconds
  Find.match(*paths) { |p| File.lstat(p).mtime > time }
end

def possibly_abandonned(*paths)
  Find.match(*paths) { |p| f = File.lstat(p); f.mtime == f.atime }
end

##################################################
# MEMOS:
# 'mtime' => Modification time, last time a file's content
# were modified.
# 'atime' => Access Time, last time a file was accessed
# 'lstat' => Information about the link itself (information about file, return a File::Stat object)
##################################################
