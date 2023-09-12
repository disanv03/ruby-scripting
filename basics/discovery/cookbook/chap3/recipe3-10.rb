# Finding the Day of the week
# Problem:
# You want to find the day of the week for a certain date.
# Use 'wday' supported by Time and DateTime as a number between 0 and 6
# Sunday is day zero

def every_sunday(d1, d2)
  # you can use 1.day instead of 60*60*24 if you're using Rails
  one_day = d1.is_a?(Time) ? 60*60*24 : 1
  sunday = d1 + ((7-d1.wday) % 7) * one_day
  while sunday < d2
    yield sunday
    sunday += one_day * 7
  end
end

def print_every_sunday(d1, d2)
  every_sunday(d1, d2) { |sunday| puts sunday.strftime("%x") }
end

puts print_every_sunday(Time.local(2023, 9, 12), Time.local(2023, 10, 12))

# Finding the week of the year

require 'date'

module Week
  def week
    (yday + 7 - wday) / 7
  end
end

class Date
  include Week
end

class Time 
  include Week
end

saturday = DateTime.new(2005, 1, 1)
puts saturday.week
puts (saturday+1).week
puts (saturday-1).week
