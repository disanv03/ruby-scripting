# recipe 13.10
# Compressing and Archiving Files with Gzip and Tar

require 'zlib'

# Most common compression format on Unix systems is gzip
file = 'compressed.gz'
Zlib::GzipWriter.open(file) do |gzip|
  gzip << "For my next trick, I'll be written to a compressed file."
  gzip.close
end

open(file, 'rb') { |f| f.read(10) }
Zlib::GzipReader.open(file) { |gzip| gzip.read }

# Gzip compress a single file. What if you want to smash multiple
# files together into a single archives ?
# The standard archive format for Unix is tar, called tarballs
# On Unix archiving and compression are separate step

require 'archive/tar/minitar'

open('tarball.tar', 'wb') do |f|
  Archive::Tar::Minitar::Write.open(f) do |w|
    w.add_file('file1', :mode => 0644, :mtime => Time.now) do |stream, io|
      stream.write('This is file 1')
    end

    w.mkdir('subdirectory', :mode => 0755, :mtime => Time.now)

    w.add_file('subdirectory/file2', :mode => 0600, :mtime => Time.now) do |stream, io|
      stream.write('This is file 2')
    end
  end
end

# print out its contents:
def browse_tarball(filename)
  open(filename, 'rb') do |f|
    Archive::Tar::Minitar::Reader.open(f).each do |entry|
      puts %{I see a file "#{entry.name}" that's #{entry.size} bytes long.}
    end
  end
end

browse_tarball('tarball.tar')
