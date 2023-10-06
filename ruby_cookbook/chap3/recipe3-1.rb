# Finding Today's Date
# Problem:
# You need to create an object that represents the current date and time or a time in
# the future or past

now = Time.now

puts now.gmtime
# the original object was affected by the time zone conversion.
puts now

require 'date'
now2 = DateTime.now

puts now2.to_s
puts now2.new_offset.to_s
# No affected by the time zone conversion
puts now2.to_s

puts "####"
now_time = Time.new
now_datetime = DateTime.now
puts now_time.year
puts now_datetime.year
puts now_time.hour
puts now_datetime.hour
puts now_time.zone
puts now_datetime.zone
puts now_time.isdst
puts now_datetime.offset
puts "microseconds"
puts now_time.usec
puts now_datetime.sec_fraction

puts Time.local(1999, 12, 31, 23, 21, 5, 1055)
puts Time.gm(1999, 12, 31, 23, 21, 5, 22, 1044)
puts Time.local(1991, 10, 1)
puts Time.gm(2000)

puts DateTime.civil(1990, 12, 31, 23, 21, Rational(51044, 100000)).to_s
puts DateTime.civil(1991, 10, 1).to_s
puts DateTime.civil(2000).to_s
