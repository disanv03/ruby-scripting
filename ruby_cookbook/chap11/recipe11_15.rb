# Converting HTML documents from the web into text
# Problem:
# You want to get a text summary of a web site

require 'open-uri'

url = 'http://www.example.com/'

begin
  content = URI.open(url).read
rescue Exception => e
  puts "Error occurred: #{e.message}"
end

plain_text = content.sub(%r{<body.*?>(.*?)</body>}mi, '\1').gsub(/<.*?>/m, ' ').gsub(%r{(\n\s*){2,}}, "\n\n")

puts plain_text
