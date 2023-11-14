# Stopping an iteration
# Problem:
# You want to interrupt an iteration from within the code block you
# passed into it.

1.upto(10) do |x|
  puts x
  break if x == 3
end

aBlock = Proc.new do |x|
  puts x
  break if x == 3
  puts x + 2
end

aBlock.call(5)
# 5
# 7

# aBlock.call(3)
# => 3
# => LocalJumpError : break from proc-closure

# throw can jump to the end of a corresponding catch block

def find(*paths)
  paths.each do |p|
    catch(:prune) do
      # Process p as a file or directory...
    end
    # When you call Find.prune you'll end up here
  end
end

def prune
  throw :prune
end