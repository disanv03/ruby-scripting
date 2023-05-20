# String literals where elements are separated by whitespace
arr = %w(hello world! Ruby is amazing)
p arr

# String literals with interpolation or evaluation
arr = %W(Hi #{ENV['USERNAME']} enjoy #{RUBY_VERSION})
p arr


array = %W(Current_user_#{ENV['USERNAME']} Home_directory_#{ENV['HOME']} Operating_system_#{RUBY_PLATFORM}
           Process_ID_#{Process.pid} Current_directory_#{Dir.pwd})
           