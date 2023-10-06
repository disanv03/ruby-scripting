# Printing a Date
# Problem:
# You want to print a date object as a string

require 'date'

puts Time.now.to_s
puts DateTime.now.to_s # ISO 8601 format

# Specific format

puts Time.gm(2006).strftime('The year is %Y!') # gm => Greenwich Mean

time = Time.gm(2005, 12, 31, 13, 22, 33)
american_date = '%D' # %D shorthand for american date format %m/%d/%y
puts time.strftime(american_date)

european_date = '%d/%m/%y'
puts time.strftime(european_date)

four_digit_year_date = '%d/%m/%Y'
puts time.strftime(four_digit_year_date)

date_and_time = '%m-%d-%Y %H:%M:%S %Z'
puts time.strftime(date_and_time)

twelve_hour_clock_time = '%m-%d-%Y %I:%M:%S %p' # %I for intuitive ? %p for period (AM or PM)
puts time.strftime(twelve_hour_clock_time)

word_date = '%A, %B %d, %Y'
puts time.strftime(word_date)

time2 = Time.now
puts time2.strftime('%c')

class Time
  def day_ordinal_suffix
    if day == 11 or day == 12
      return "th"
    else
      case day % 10
      when 1 then return "st"
      when 2 then return "nd"
      when 3 then return "rd"
      else return "th"
      end
    end
  end
end

puts time.strftime("The %e#{time.day_ordinal_suffix} of %B")
