# Converting Between Time Zones
# Problem:
# You want to change a time object so that it represents the same moment of time in some other time zone

# The most common time zone conversions are the conversion of system local time to UTC (Coordinatae Universal Time)
# GMT is the same as UTC

puts now = Time.now
puts now = now.gmtime
puts now = now.localtime

require 'date'
local = DateTime.now
puts local.to_s
utc = local.new_offset(0)
puts utc.to_s

# Convert UTC to local time
local = DateTime.now
utc = local.new_offset

puts local.offset # => 1/12 represents 2 hours
puts local_from_utc = utc.new_offset(local.offset)


# Convert local (Eastern) time to pacific time
# new_offset doesn't add offset together; it converts the time from one offset to another.
# DateTime objects are immutable.
eastern = DateTime.now
puts eastern.to_s

pacific_offset = Rational(-7, 24)
pacific = eastern.new_offset(pacific_offset)
puts pacific.to_s

class Time
  def convert_zone(to_zone)
    original_zone = ENV["TZ"]
    utc_time = dup.gmtime
    ENV["TZ"] = to_zone
    to_zone_time = utc_time.localtime
    ENV["TZ"] = original_zone
    return to_zone_time
  end
end

puts t = Time.at(1000000000)
puts t.convert_zone("US/Pacific")
puts t.convert_zone("US/Alaska")
puts t.convert_zone("UTC")
puts t.convert_zone("Turkey")
puts t.convert_zone("Asia/Calcutta")

# Default setting /etc/localtime
# if TZ is set in ENV, this affects how time is displayed
# if TZ not set ruby refer to /etc/localtime

puts Time.now # system current setting
ENV["TZ"] = "UTC"
puts Time.now # display UTC
ENV["TZ"] = nil # unset TZ
puts Time.now # system current setting

# By setting the TZ environment variable before creating a Time object, you can represent the time in any
# time zone. The following converts Lagos to Singapore Time, regardless of the "real" underlying time zone.

ENV["TZ"] = "Africa/Lagos"
puts t = Time.at(1000000000)
ENV["TZ"] = nil

puts t.convert_zone("Singapore")

