# Bring OptionParser into the namespace
require 'optparse'

options = {}
option_parser = OptionParser.new do |opts|
 # Create a switch
 opts.on("-i","--iteration") do
  options[:iteration] = true
 end
 # Create a flag
 opts.on("-u USER") do |user|
  options[:user] = user
 end

 servers = {
    'dev' => '127.0.0.1',
    'qa' => 'www.server.com',
    'prod' => 'www.example.com'
  }

  opts.on("--server SERVER", servers) do |address|
   # for --server=dev, adress would be '127.0.0.1'
   # for --server=prod, address woulb be 'www.example.com'
   options[:address] = address
  end

 opts.on("-p PASSWORD") do |password|
  options[:password] = password
 end
end

option_parser.parse!
puts options.inspect
