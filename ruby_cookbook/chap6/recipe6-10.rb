# Comparing Two Files
# Problem:
# You want to see if two files contain the same data.
# If they differ, you might want to represent the differences between them as a string:
# a patch from one to the other.

class File
  def File.same_contents(p1, p2)
    return false if File.exists?(p1) != File.exists?(p2)
    # In this context non-existent files are considered to have the "same content" ??
    return true if !File.exists?(p1)
    return true if File.expand_path(p1) == File.expand_path(p2)
    return false if File.ftype(p1) != File.ftype(p2) || File.size(p1) != File.size(p2)
    
    # Otherwise, compares the files contents, a block at a time
    open(p1) do |f1|
      open(p2) do |f2|
        # retrieves the block size for f1
        blocksize = f1.lstat.blksize
        same = true
        while same && !f1.eof? && !f2.eof
          same = f1.read(blocksize) == f2.read(blocksize)
        end
        return same
      end
    end
  end
end

1.upto(2) do |i|
  open("output#{i}", 'w') { |f| f << 'x' * 10000 }
end
File.same_contents('output1', 'output2') # => true
open("output1", 'a') { |f| f << 'x' }
open("ouptut2", 'a') { |f| f << 'y' }
File.same_contents('output1', 'output2') # => false
File.same_contents('nosuchfile', 'output1') # => false
File.same_contents('nosuchfile', 'nosuchfile2') # => true

