# Bring OptionParser into the namespace
require 'optparse'

options = {}
option_parser = OptionParser.new do |opts|
  executable_name = File.basename($PROGRAM_NAME)
  opts.banner = "     Backup one or more MySQL databases
    
  Usage: #{executable_name} [options] database_name"
 # Create a switch
 # any string given as a parameter to on that doesn't match
 # the format of an option will be treated as documentation
 opts.on('-i','--iteration',
          'Indicate that this backup is an "iteration" backup') do
  options[:iteration] = true
 end
 # Create a flag
 opts.on('-u USER',
         'Database username') do |user|
  options[:user] = user
 end

 servers = {
    'dev' => '127.0.0.1',
    'qa' => 'www.server.com',
    'prod' => 'www.example.com'
  }

  opts.on('-s','--server SERVER', servers, 'Server name') do |address|
   # for --server=dev, adress would be '127.0.0.1'
   # for --server=prod, address woulb be 'www.example.com'
   options[:address] = address
  end

 opts.on('-p PASSWORD', 'Database password') do |password|
  options[:password] = password
 end
end

option_parser.parse!
if ARGV.empty?
  puts "error: you must supply a database_name"
  puts
  puts option_parser.help
else
  database_name = ARGV[0]
  # proceed as normal to backup database_name
end
puts options.inspect
