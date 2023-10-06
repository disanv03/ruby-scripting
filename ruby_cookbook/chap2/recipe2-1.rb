# Parsing a Number from a String

'400'.to_i
'3.14'.to_f
'1.602e-19'.to_f

'405'.oct
'405'.to_i(8)
'405'.hex
'405'.to_i(16)
'fed'.hex
'fed'.to_i(16)

"13: a baker's dozen".to_i
'1001 Nights'.to_i
'The 1000 Nights and a Night'.to_i
'60.50 Misc. Agricultural Equipment'.to_f
'$60.50'.to_f
'Feed the monster!'.hex
'I fed the monster at Canoga Park Waterslides'.hex
'0xA2Z'.hex
'-10'.oct
'-109'.oct
'3.14'.to_i

Integer('1001')
Integer('1001 nights')
Float('99.44')
Float('99.44% pure')

class NumberParser
  @@number_regexps = {
    :to_i => /([+-]?[0-9]+)/,
    :to_f => /([+-]?([0-9]*\.)?[0-9]+(e[+-]?[0-9]+)?)/,
    :oct => /([+-]?[0-7]+)/,
    :hex => /\b([+-]?(0x)?[0-9a-f]+)\b/i
  }

  def NumberParser.re(parsing_method=:to_i)
    re = @@number_regexps[parsing_method]
    raise ArgumentError, "No regexp for #{parsing_method.inspect}!" unless re
    return re
  end

  def extract(s, parsing_method=:to_i)
    numbers = []
    s.scan(NumberParser.re(parsing_method)) do |match|
      numbers << match[0].send(parsing_method)
    end
    numbers
  end
end

p = NumberParser.new
pw = "Today's numbers are 104 and 391."
NumberParser.re(:to_i).match(pw).captures
p.extract(pw, :to_i)

p.extract('The 1000 nights and a night')
p.extract('$60.50', :to_f)
p.extract('I fed the monster at Canoga Park Waterslides', :hex)
p.extract('In octal, fifteen is 017.', :oct)
p.extract('From 0 to 10e60 in -2.4 seconds', :to_f)
p.extract('From 0 to 10e60 in -2.4 seconds')

require 'scanf'
s = '0x10 4.44 10'.scanf('%x %f %d')

