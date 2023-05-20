def scan_directory(directory_path)
  if Dir.exist?(directory_path)
    puts "Files in #{directory_path}:"
    Dir.entries(directory_path).each do |file|
      next if ['.', '..'].include?(file)
      puts file
    end
  else
    puts "directory does not exist: #{directory_path}"
  end
end

scan_directory("C:\\your_directory_name")
