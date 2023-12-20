# Parsing Invalid Markup
# Problem:
# You need to extract data from a document that's supposed to be HTML or 
# XML, but that contains some invalid markup

require 'rubygems'
require 'nokogiri'

invalid_html = 'A lot of <b class=1> tags are <i class=2>never closed.'
document = Nokogiri::HTML::DocumentFragment.parse(invalid_html)
puts document.to_html

# Accesing nested elements
puts document.at_css('b i').to_html
puts document.at_css('i').to_html

# Finding elements by attribute
puts document.css('[class="2"]').to_html

document.css('i').each do |element|
  puts element.to_html
end

# Accessing attributes of an element
puts document.at_css('b')['class']

# Finding text with a regex
puts document.text.match(/closed/)[0]

require 'set'

html = %{<a name="anchor"><a href="http://www.oreilly.com">O'Reilly</a>
         <b>irrelevant</b><a href="http://www.ruby-lang.org/">Ruby</a>}

class LinkGrabber
  attr_reader :urls

  def initialize(html)
    @html = html
    @urls = Set.new
  end

  def extract_urls
    document = Nokogiri::HTML(@html)
    document.css('a').each do |link|
      @urls << link['href'] if link['href']
    end
  end
end

extractor = LinkGrabber.new(html)
extractor.extract_urls
puts extractor.urls
