# Converting Between Time and Date Time Objects
# Problem:
# You're working with both DateTime and Time objects, created from Ruby's two standard date/time libraries. 
# You can't mix these objects in comparisons, iterations, or date arithmetic because they're incompatible. 
# You want to convert all the objects into one form or another so that you can treat them all the same way.

require 'date'

class Time
  def to_datetime
    # Convert seconds + microseconds into a fractional number of seconds
    seconds = sec + Rational(usec, 10**6)
    # Convert a UTC offset measured in minutes to one measured in a fraction of a day
    offset = Rational(utc_offset, 60 * 60 * 24)
    DateTime.new(year, month, day, hour, min, seconds, offset)
  end
end

time = Time.gm(2000, 6, 4, 10, 30, 22, 4010)
puts time.to_datetime.to_s

class Date
  def to_gm_time
    convert_to_time(new_offset, :gm)
  end

  def to_local_time
    offset_difference = DateTime.now.offset - offset
    adjusted_offset = new_offset(offset_difference)
    convert_to_time(adjusted_offset, :local)
  end
  
  private
  def convert_to_time(dest, method)
    # Convert a fraction of a day to a number of microseconds
    usec = (dest.sec_fraction * 60 * 60 * 24 * (10**6)).to_i
    usec %= 1_000_000 # ensuring usec is within the acceptable range
    Time.send(method, dest.year, dest.month, dest.day, dest.hour, dest.min, dest.sec, usec)
  end
end

datetime = DateTime.new(1990, 10, 1, 22, 16, Rational(41,2))
puts datetime.to_s
puts datetime.to_gm_time
puts datetime.to_local_time

