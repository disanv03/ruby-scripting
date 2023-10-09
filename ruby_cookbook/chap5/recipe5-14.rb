# Extracting portions if hashes
# Problem:
# You have a hash that contains a lot of values, but only a few of them are 
# interesting. You want to select the interesting values and ignore the rest.

require 'time'
click_counts = {}
1.upto(30) { |i| click_counts[Time.parse("2006-09-#{i}")] = 400 + rand(700) }
click_counts

p low_click_days = click_counts.select {|key, value| value < 500}

# Using inject
low_click_days_with_inject = click_counts.inject({}) do |h, kv|
  k, v = kv
  h[k] = v if v < 450
  h
end

p low_click_days_with_inject
