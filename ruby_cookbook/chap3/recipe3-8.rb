# Checking whether daylight saving time is in effect
# Problem:
# You want to see whether the current time in your locale is normal time or daylight saving/summer time

puts Time.local(2006, 1, 1)
puts Time.local(2006, 1, 1).isdst
puts Time.local(2006, 10, 1)
puts Time.local(2006, 10, 1).isdst

puts eastern = Time.local(2006, 10, 1)
puts eastern.isdst
ENV['TZ'] = 'US/Pacific'
pacific = Time.local(2006, 10, 1)
puts pacific.isdst
ENV['TZ'] = 'America/Phoenix'
puts arizona = Time.local(2006, 10, 1)
puts arizona.isdst
ENV['TZ'] = nil

# Daylight saving first took effect on March 31, 1918.

puts Time.local(1918, 3, 31).isdst
puts Time.local(1918, 4, 1).isdst
puts Time.local(1919, 4, 1).isdst

# The federal law was repealed later in 1919, but some places continued to use dst.
ENV['TZ'] = 'US/Pacific'
puts Time.local(1920, 4, 1)
ENV['TZ'] = nil
puts Time.local(1920, 4, 1)

# Daylight saving time was reintroducted during the second world war.
puts Time.local(1942, 2, 9)
puts Time.local(1942, 2, 10)

puts Time.local(2007, 3, 13)
