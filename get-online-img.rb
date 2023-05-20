require 'nokogiri'
require 'open-uri'
require 'fileutils'

# The URL of the webpage you want to extract images from
url = 'https://www.midjourney.com/showcase/recent/' 

# The folder where the images will be saved
folder = 'images'

# Create the folder if it doesn't exist
FileUtils.makedirs(folder) unless File.directory?(folder)

begin
  doc = Nokogiri::HTML(URI.open(url))

  # Get all img tags
  doc.css('img').each do |img|
    img_url = img.get_attribute('src')

    # Resolve relative URLs
    img_url = URI.join(url, img_url)

    # Get the image name
    img_name = File.basename(img_url.path)

    # Open and write the image to a file
    File.open(File.join(folder, img_name), 'wb') do |f|
      f.write(URI.open(img_url).read)
    end
  end

rescue OpenURI::HTTPError => e
  puts "Couldn't reach the page: #{e.message}"
rescue Errno::EINVAL => e
  puts "Invalid URL: #{e.message}"
end

