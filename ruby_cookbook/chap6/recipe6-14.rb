# Backing up to versioned filenames
# Problem:
# You want to copy a file to a numbered backup before overwriting the
# original file. More generally: rather than overwriting an existing file,
# you want to use a new file whose name is based on the original filename.

# Use String#succ to generate versioned suffixes for a filename until
# you find one that doesn't already exist:

class File
  def File.versioned_filename(base, first_suffix='.0')
    suffix = nil
    filename = base
    while File.exist?(filename)
      # If suffix is not nil, get the next value of suffix
      # Otherwise, set the suffix to the provided first_suffix
      suffix = (suffix ? suffix.succ : first_suffix)
      filename = base + suffix
    end
    return filename
  end
end
5.times do |i|
  name = File.versioned_filename('filename.txt')
  open(name, 'w') { |f| f << "Contents for run #{i}" }
  puts "Created #{name}"
end

require 'ftools'
class File
  def File.to_backup(filename, move=false)
    new_filename = nil
    if File.exist?(filename)
      new_filename = File.versioned_filename(filename)
      File.send(move ? :move : :copy, filename, new_filename)
    end
    return new_filename
  end
end

File.to_backup('filename.txt')
File.to_backup('filename.txt')

# Destructive backup
File.to_backup('filename.txt', true)
File.exist?('filename.txt')

File.to_back('filename.txt')

# If you anticipate more than 10 versions of a file, you should add additional
# zeroes to the initial suffix. A commonly used suffix is ".000".

200.times do |i|
  name = File.versioned_filename('many_versions.txt', '.000')
  open(name, 'w') { |f| f << "Contents for run #{i}" }
  puts "Created #{name}"
end

class File
  def File.versioned_file(base, first_suffix='.0', access_mode='w')
    suffix = file = locked = nil
    filename = base
    begin
      suffix = (suffix ? suffix.succ : first_suffix
      unless File.exist(filename)
        file = open(filename, access_mode)
        locked = file.flock(File::LOCK_EX | File::LOCK_NB)
        file.close unless locked
      end
    end until locked
    return file
  end
end

File.versioned_file('contested_file')
File.versioned_file('contested_file')
File.versioned_file('contested_file')

