# Converting from one encoding to another
# Problem:
# You want to convert a document to a given charset encoding (probably UTF-8)

doc = %{<?xml version="1.0"?>
        <menu tipo="specialità" giorno="venerdi">
        <primo_piatto>spaghetti al ragu</primo_piatto>
          <bevanda>frappe</bevanda>
          </menu>}

# Let's figure out its encoding and convert it to UTF-8

require 'iconv'
require 'charguess'

input_encoding = CharGuess::guess doc
output_encoding = 'utf-8'
converted_doc = Iconv.new(output_encoding, input_encoding).iconv(doc)
CharGuess::guess(converted_doc)

# Note:
# You can use libcharguess and iconv together to convert an arbitrary string
# to a given encoding
