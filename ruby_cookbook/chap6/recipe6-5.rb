# Listing a Directory
# Problem:
# You want to list or process the files or subdirectories within a directory.

# create_tree

def create_tree(directories, parent=".")
  directories.each_pair do |dir, files|
    path = File.join(parent, dir)
    Dir.mkdir path unless File.exist? path
    files.each do |filename, contents|
      if filename.respond_to? :each_pair
        create_tree filename, path
      else
        open(File.join(path, filename), 'w') {|f| f << contents || "" }
      end
    end
  end
end

# create_tree 'test' => [ 'An empty file',
#                         ['A file with contents', 'contents of file'],
#                         { 'Subdirectory' => ['Empty file in subdirectory',
#                                             ['file in subdirectory', 'contents of file'] ] },
#                         { 'Empty sudirectory' => [] }
# ]

# create_tree 'mydir' => [ {'subdirectory' => [['file_in_subdirectory', 'just a simple file.']] },
#                         '.hidden_file', 'ruby_script.rb', 'text_file' ]

# p Dir.entries('mydir')
# Dir.foreach('mydir') { |x| puts x if x != "." && x != ".." }

# Find all the "regular" files and subdirectories in mydir
# This exclude hidden files, and the special directories . and ..
# p Dir["mydir/*"]
# Find all the .rb files in mydir
# p Dir["mydir/*.rb"]

# p Dir.open('mydir') { |d| d.grep /file/ }
# Dir.open('mydir') { |d| d.each { |x| puts x } }

# d = Dir.open('mydir')
# p d.reject { |f| f[0] == '.' }

# Get the name of all files in the directory
# p d.reject { |f| !File.file? File.join(d.path, f) }

# p Dir["mydir/**/*"]
# p Dir["mydir/**/*file*"]

# Regex-style character classes
# p Dir["mydir/[rs]*"]
# p Dir["mydir/[^s]*"]

# Match any of the given strings
# p Dir["mydir/{text,ruby}*"]

# Single-character wildcards
# p Dir["mydir/?ub*"]

# p Dir["mydir/.*"]
