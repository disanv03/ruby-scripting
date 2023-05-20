require 'fileutils'

def create_directory_with_date
  base_directory = "C:\\Users\\your_name"
  date_string = Time.now.strftime("%d%m%Y")
  directory_name = "#{base_directory}/#{date_string}" 

  FileUtils.mkdir_p directory_name
  puts "Directory created: #{directory_name}"
end

# call the method with your directory path
create_directory_with_date

