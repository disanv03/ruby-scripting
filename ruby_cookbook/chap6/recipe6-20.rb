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
