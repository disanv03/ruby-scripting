# Substituting variables

require 'erb'

template = ERB.new %q{Chunky <%= food %>!}
food = "bacon"
puts template.result(binding)

food = "peanut butter"
puts template.result(binding)

