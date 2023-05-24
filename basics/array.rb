# String literals where elements are separated by whitespace
arr = %w(hello world! Ruby is amazing)
p arr

# String literals with interpolation or evaluation
arr = %W(Hi #{ENV['USERNAME']} enjoy #{RUBY_VERSION})
p arr


array = %W(Current_user_#{ENV['USERNAME']} Home_directory_#{ENV['HOME']} Operating_system_#{RUBY_PLATFORM}
           Process_ID_#{Process.pid} Current_directory_#{Dir.pwd})

array.class # Output array

# %i creates an array of symbols
keys_symbols = %i(name age occupation)
values = ["John", 25, "Engineer"]

hash = keys_symbols.zip(values).to_h
puts hash # Output: { :name=>"John", :age=>25, :occupation=>"Engineer" }


keys = [nil,1,2,3,4,5,6,7,8,9]
values_roman = %w(nil I II III IV V VI VII VII IX X)
hash = keys.zip(values_roman).to_h
hash.class

#################
# memo for array
#################
# shift, pop
# unshift, append or <<
#################
