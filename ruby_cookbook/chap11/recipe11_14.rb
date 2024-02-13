# Transforming Plain Text to HTML
# Problem:
# You want to add simpe markup to plaintext and turn it into HTML

require 'rubygems'
require 'redcloth'

text = RedCloth.new %{Who would ever write
"HTML":http://www.w3.org/MarkUp/
markup directly ?

I mean, _who has the time_? Nobody, that's who:

|_. Person |_. Has the time?         |
|   Jake   |      No                 |
|   Alice  |      No                 |
|   Rodney |   Not since the 1990    |

}

puts text.to_html

# The textile version is more readable and easier to edit
# The RedCloth homepage (http://www.whytheluckystiff.net/redcloth/)
# Textile reference (http://hobix.com/textile/)
# Quick Textile reference (http://hobix.com/textile/quick.html)
# Experiment Textile (http://www.textism.com/tools/textile/)

