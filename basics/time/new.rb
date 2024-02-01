require 'date'

date = Date.new(1990, 1, 1, Date::ENGLAND)

month = 1
rows = [Date::MONTHNAMES[month].center(20), "Su Mo Tu We Th Fr Sa"]
days = []
date.wday.times { days.push "  " }
while date.month == month
  days.push("%2d" %date.mday)
  date += 1
end
(42 - days.length).times { days.push " " }
days.each_slice(7) do |week|
  rows.push(week.join(" "))
end

puts rows
