# Generating a Succession of Strings

puts ('aa'..'ag').each { |x| puts x }

def endless_string_succession(start)
  while true
    yield start
    start = start.succ
  end
end

# stopping when the last two letters are the same

endless_string_succession('fol') do |x|
  puts x
  break if x[-1] == x[-2]
end
