# Word-Wrapping Lines of Text

# capture one or more whitespace characters \s+ or the end of string \Z
# \\1\n backreference refers to the first capture group and add a newline at his end
def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
end

puts wrap("This text is too short to be wrapped.")

puts wrap("This text is not too short to be wrapped.", 20)

puts wrap("These ten-characters columns are stifling my creativity!", 10)
