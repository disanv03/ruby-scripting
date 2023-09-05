# Parsing Dates, Precisely or Fuzzily
# Problem:
# You want to transform a string describing a date or date/time into a Date Object.
# You might not know the format of the string ahead of time.


require 'date'

puts Date.parse('2/9/2007').to_s
puts DateTime.parse('02-09-2007 12:30:44 AM').to_s
puts DateTime.parse('02-09-2007 12:30:44 PM EST').to_s
puts DateTime.parse('Wednesday, January 10, 2001').to_s

american_date = '%m/%d/%y'
puts Date.strptime('2/9/07', american_date).to_s
puts Date.strptime('2/9/05', american_date).to_s
puts Date.strptime('2/9/68', american_date).to_s
puts Date.strptime('2/9/69', american_date).to_s

european_date = '%d/%m/%y'
puts Date.strptime('2/9/07', european_date).to_s
puts Date.strptime('02/09/68', european_date).to_s
puts Date.strptime('2/9/69', european_date).to_s

four_digit_year_date = '%m/%d/%Y'
puts Date.strptime('2/9/2007', four_digit_year_date).to_s
puts Date.strptime('02/09/1968', four_digit_year_date).to_s
puts Date.strptime('2/9/69', four_digit_year_date).to_s

date_and_time = '%m-%d-%Y %H:%M:%S %Z'
puts DateTime.strptime('02-09-2007 12:30:44 EST', date_and_time).to_s
puts DateTime.strptime('02-09-2007 12:30:44 PST', date_and_time).to_s
puts DateTime.strptime('02-09-2007 12:30:44 GMT', date_and_time).to_s

twelve_hour_clock_time = '%m-%d-%Y %I:%M:%S %p'
puts DateTime.strptime('02-09-2007 12:30:44 AM', twelve_hour_clock_time).to_s
puts DateTime.strptime('02-09-2007 12:30:44 PM', twelve_hour_clock_time).to_s

word_date = '%A, %B %d, %Y'
puts Date.strptime('Wednesday, January 10, 2001', word_date).to_s


puts Date.parse('1/10/07').to_s
# puts Date.parse('2007 1 10').to_s

TRY_FORMATS = ['%d/%m/%y', '%Y %m %d']

def try_to_parse(s)
  parsed = nil
  TRY_FORMATS.each do |format|
    begin
      parsed = Date.strptime(s, format)
      break
    rescue ArgumentError => e
      puts "Error while trying format #{format}: #{e.message}"
    end
  end
  return parsed
end

puts try_to_parse('1/10/07').to_s
puts try_to_parse('2007 1 10').to_s

# RFC822/RFC2822 the Internet email standard

require 'time'
mail_received = 'Tue, 1 Jul 2003 10:52:37 +0200'
puts Time.rfc822(mail_received)

last_modified = 'Tue, 05 Sep 2006 16:05:51 GMT'
puts Time.httpdate(last_modified)

timestamp = '2001-04-17T19:23:17.201Z'
t = Time.iso8601(timestamp)
puts t.sec
puts t.tv_usec

t = Time.at(1000000000)
puts t.rfc822
puts t.httpdate
puts t.iso8601

