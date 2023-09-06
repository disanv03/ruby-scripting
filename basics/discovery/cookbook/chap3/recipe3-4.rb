# Iterating Over Dates
# Problem:
# Given a point in time, you want to get somewhere else

require 'date'

(Date.new(1776, 7, 2)..Date.new(1776, 7, 4)).each { |x| puts x }

span = DateTime.new(1776, 7, 2, 1, 30, 15)..DateTime.new(1776, 7, 4, 7, 0, 0)
span.each { |x| puts x }

# (Time.at(100)..Time.at(102)).each { |x| puts x }
# Time.at adding a number of seconds since the Unix Epoch (Jan, 1, 1970, 00:00:00 UTC)
(100..102).each do |timestamp|
  puts Time.at(timestamp).gmtime
end

the_first = Date.new(2004, 1, 1)
the_fifth = Date.new(2004, 1, 5)

the_first.upto(the_fifth) { |x| puts x }

class Time
  
  def step(other_time, increment)
    # info: increment can be either positive or negative.
    raise ArgumentError, "step can't be 0" if increment == 0
    increasing = self < other_time
    if (increasing && increment < 0) || (!increasing && increment > 0)
      yield self
      return
    end
    d = self
    begin
      yield d
      d += increment
    end while (increasing ? d <= other_time : d >= other_time)
  end

  def upto(other_time)
    step(other_time, 1) { |x| yield x }
  end

end

the_first = Time.local(2004, 1, 1)
the_second = Time.local(2004, 1, 2)
the_first.step(the_second, 60*60*6) { |x| puts x }
the_first.upto(the_first) { |x| puts x }


           


