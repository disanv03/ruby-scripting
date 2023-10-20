# Walking a Directory Tree
# Problem:
# You want to recursively process every subdirectory and file
# within a certain directory.

require './recipe6-5'

create_tree './' =>
  [ 'file1',
    'file2',
      { 'subdir1/' => [ 'file1' ] },
      { 'subdir2/' => [ 'file1',
                        'file2',
                        { 'subsubdir/' => [ 'file1' ] }
      ]
      }
  ]

# Dir[] alias for Dir.glob generates an array of filenames found by pattern
p Dir['**/**']

# Elegant solution with the use of find method

require 'find'

Find.find('./') { |path| puts path }

puts '#######'
# Find.prune method allows to skip certain branches of the tree during the traversal
# prune for skip or trim away
Find.find('./') do |path|
  Find.prune if File.basename(path) == 'subdir2'
  puts path
end

# Calling Find.prune when your block has been passed a file 
# will only prevent Find.find from processing that one file.

Find.find('./') do |path|
  if File.basename(path) =~ /file2$/
    puts "PRUNED #{path}"
    Find.prune
  end
  puts path
end

Dir["**/**"].sort.each { |x| puts x }
