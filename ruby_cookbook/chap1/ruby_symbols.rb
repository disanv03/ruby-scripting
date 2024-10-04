# Converting Between Strings and Symbols

# A Symbol is about the most basic Ruby object you can create.
# It's just a name and an internal ID.
# Symbols are useful because a given symbol name refers to the
# same object throughout a Ruby program.
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
