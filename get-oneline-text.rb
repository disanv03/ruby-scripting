require 'open-uri'
require 'nokogiri'

url = 'http://www.pragprog.com'
begin
  doc = Nokogiri::HTML(URI.open(url))
  page_text = doc.text

  File.open("output.txt", "w") do |file|
    file.write(page_text)
  end

rescue OpenURI::HTTPError => e
  puts "Couldn't reach the page: #{e.message}"
rescue Errno::EINVAL => e
  puts "Invalid URL: #{e.message}"
end

