# Extracting all the URLs from an HTML document
# Problem:
# You want to find all the URLs on a web page

require 'uri'

text = %{"My Homepage is at <a href="http://www.example.com/">http://www.example.com/</a>, and be sure to check out my weblog att http://blog.com/web/.
Email me at <a href="mailto:bob@example.com">bob@example.com</a>.}

puts URI.extract(text)

# Get HTTP(S) links only.
puts URI.extract(text, ['http', 'https'])

require 'rexml/document'
require 'rexml/streamlistener'
require 'set'

class LinkGrabber
  include REXML::StreamListener
  attr_reader :links

  def initialize(interesting_tags = {'a' => %w{href}, 'img' => %w{src}}.freeze)
    @tags = interesting_tags
    @links = Set.new
  end

  def tag_start(name, attrs)
    @tags[name].each do |uri_attr|
      @links << attrs[uri_attr] if attrs[uri_attr]
    end if @tags[name]
  end

  def parse(text)
    REXML::Document.parse_stream(text, self)
  end
end

grabber = LinkGrabber.new
grabber.parse(text)
puts grabber.links
