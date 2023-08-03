# Converting Between Strings and Symbols

puts :a_symbol.to_s
puts :AnotherSymbol.id2name
puts :"Yet another symbol!".to_s


puts :dodecahedron.object_id
symbol_name = "dodecahedron"

# intern method is used to convert a string to a symbol
puts symbol_name.intern
puts symbol_name.intern.object_id


# Symbols are unique and immutable. They have the same ID even though you created
# the symbol in two different way
