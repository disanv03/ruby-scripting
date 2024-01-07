# Guessing a Document's Encoding
# Problem:
# You want to know the character encoding of a document that
# doesn't declare it explicitly

doc = %{<?xml version="1.0"?>
<menu tipo="specialità" giorno="venerdì">
<primo_piatto>spaghetti al ragù</primo_piatto>
<bevanda>frappè</bevanda>
</menu>}

require 'charguess'

CharGuess::guess doc
