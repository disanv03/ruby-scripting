# Handling Commercial Dates
# Problem:
# When writing a business or financial application, you need to deal with commercial dates
# instead of civil or calendar dates.

require 'date'

sunday = DateTime.new(2006, 1, 1)
puts sunday.year
puts sunday.cwyear
puts sunday.cweek
puts sunday.wday
puts sunday.cwday


puts "#######"
puts monday = sunday + 1
puts monday.cwyear
puts monday.cweek

# DateTime#cwday is just like DateTime#wday, except it gives Sunday a value of seven instead of zero.
# Meaning that DateTime#cwday has a range from one to seven instead of from zero to six:

(sunday..sunday+7).each do |d|
  puts "#{d.strftime("%a")} #{d.wday} #{d.cwday}"
end

