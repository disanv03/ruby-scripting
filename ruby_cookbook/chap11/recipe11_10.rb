# Compressing whitespace in an XML document
# Problem:
# When REXML parses a document, it respects the original whitespace of
# the document's text nodes. You want to make the document smaller by
# compressing extra whitespace.

require 'rexml/document'

text = %{<doc><a>Some whitespace</a> <b>Some more</b></doc>}
REXML::Document.new(text, { :compress_whitespace => :all} ).to_s

REXML::Document.new(text, { :compress_whitespace => %w{a} } ).to_s

REXML::Document.new(text, { :respect_whitespace => %w{a} } ).to_s

text = %{<doc><a>Some text</a>\n <b>Some more</b>\n\n</doc>}
compressed_xml = REXML::Document.new(text, { :compress_whitespace => :all }).to_s
compressed_ignored_xml = REXML::Document.new(text, { 
  :compress_whitespace => :all, 
  :ignore_whitespace_nodes => :all 
}).to_s
