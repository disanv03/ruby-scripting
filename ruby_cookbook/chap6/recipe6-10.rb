# Comparing Two Files
# Problem:
# You want to see if two files contain the same data.
# If they differ, you might want to represent the differences between them as a string:
# a patch from one to the other.

class File
  def File.same_contents(p1, p2)
    # Sequential return
    # First check if one file exists while the other doesn't
    return false if File.exist?(p1) != File.exist?(p2)
    # Given the previous checks, if p1 doesn't exist, then p2 also don't,
    # return true as two non-existent file is treated as having the same content
    return true if !File.exist?(p1)
    return true if File.expand_path(p1) == File.expand_path(p2)
    return false if File.ftype(p1) != File.ftype(p2) || File.size(p1) != File.size(p2)
    
    # Otherwise, compares the files contents, a block at a time
    open(p1) do |f1|
      open(p2) do |f2|
        # Give the preferred block size for efficient read/write
        blocksize = f1.lstat.blksize
        same = true
        while same && !f1.eof? && !f2.eof?
          # comparing bytes in chunks
          same = f1.read(blocksize) == f2.read(blocksize)
        end
        # Nice personal add to the current book code, to check if
        # either file has remaining content after the loop. Making sure
        # that there is no additional content beyond the eof? of one file.
        if same && (!f1.eof? || !f2.eof?)
          same = false
        end
        return same
      end
    end
  end
end

1.upto(2) do |i|
  open("output#{i}", 'w') { |f| f << 'x' * 10000 }
end
p File.same_contents('output1', 'output2') # => true
open("output1", 'a') { |f| f << 'x' }
open("ouptut2", 'a') { |f| f << 'y' }
p File.same_contents('output1', 'output2') # => false
p File.same_contents('nosuchfile', 'output1') # => false
p File.same_contents('nosuchfile', 'nosuchfile2') # => true

