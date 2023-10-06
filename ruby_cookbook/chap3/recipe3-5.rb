# Doing Date Arithmetic
# Problem:
# You want to find how much time has elapsed between two dates,
# or add a number to a date to get an earlier or later date. 

require 'date'

y2k = Time.gm(2000, 1, 1)
puts y2k + 1
puts y2k - 1
puts y2k + (60 * 60 * 24 * 365)
y2k_dt = DateTime.new(2000, 1, 1)
puts (y2k_dt + 1).to_s
puts (y2k_dt - 1).to_s
puts (y2k_dt + 0.5).to_s
puts (y2k_dt + 365).to_s

# Subtracting one Time from another gives the interval between the dates, in seconds.
# Subtracting one Date from antother gives the interval in days.

day_one = Time.gm(1999, 12, 31)
day_two = Time.gm(2000, 1, 1)

seconds = day_two - day_one
in_hours = seconds / 3600.0
puts in_hours

another_day = DateTime.new(1999, 12, 31)
another_day_two = DateTime.new(2000, 1, 1)
puts another_day_two - another_day
puts another_day - another_day_two

# Compare times from now and 10 seconds in the future.

before_time = Time.now
before_datetime = DateTime.now
# sleep(10) # pause the execution of the script for the given number of seconds.
# puts Time.now - before_time
# puts DateTime.now - before_datetime

require 'active_support/all'

puts 10.days.ago
puts 1.month.from_now
puts 1.month.from_now.strftime('%A')
puts 2.weeks.since(Time.local(2006, 1, 1))
puts y2k - 1.day
puts y2k + 6.years
puts 6.years.since y2k

# ShortCut for adding and subtracting big chunks of time:
# using the right-or left-shift operators on a Date or DateTime
# Object will add or subtract a certain number of months from the date.

puts (y2k_dt >> 1).to_s
puts (y2k_dt << 1).to_s

# Similar behavior with acticvesupport's Numeric#month
# method assumes that a "month" is 30 days longn instead of dealing with the lengths of specific months:

puts y2k + 1.month
puts y2k - 1.month

# By contrast

halloween = Date.new(2000, 10, 31)
puts "HALLOWEEN BoouuouOUUuu"
puts halloween
puts (halloween << 1).to_s
puts (halloween >> 1).to_s
puts (halloween >> 2).to_s

puts "Leap year day"
leap_year_day = Date.new(1996, 2, 29)
puts leap_year_day
puts (leap_year_day << 1).to_s
puts (leap_year_day >> 1).to_s
puts (leap_year_day >> 12).to_s
puts (leap_year_day << 12 * 4).to_s
