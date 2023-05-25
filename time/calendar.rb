require 'date'

# https://rosettacode.org/wiki/Calendar#Ruby

# Creates a calendar of _year_. Returns this calendar as a multi-line string

def cal(year)
    # start at january 1.
    date = Date.new(year, 1, 1, Date::ENGLAND) 

    # collect calendars of all 12 months
    months = (1..12).collect do |month|
        rows = [Date::MONTHNAMES[month].center(20), "Su Mo Tu We Th Fr Sa"]

        # make array of 42 slots(format), starting with sunday.
        days = []
        date.wday.times { days.push "  " }
        while date.month == month
            days.push("%2d" %date.mday)
            date += 1
        end
        (42 - days.length).times { days.push "  " }

        days.each_slice(7) { |week| rows.push(week.join " ") }
        next rows
    end

    mpr = 3;
    width = 64;
    columns = 80;

    # join months into calendar.
    rows = ["[Calendar]".center(width), "#{year}".center(width)]
    months.each_slice(mpr) do |slice|
        slice[0].each_index do |i|
            rows.push(slice.map {|a| a[i]}.join "  ")
        end
    end

    return rows.join("\n")
end

ARGV.length == 1 or abort "usage: #{$0} year"
puts cal(Integer(ARGV[0]))









