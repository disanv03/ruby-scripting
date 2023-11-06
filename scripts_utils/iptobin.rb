#!/usr/bin/env ruby

def valid_ip?(ip)
  !!ip.match(/\A(\d{1,3}\.){3}\d{1,3}\z/) && ip.split('.').map(&:to_i).all? { |octet| octet.between?(0,255) }
end

def ip_to_binary(ip)
  return 'Invalid IP address format.' unless valid_ip?(ip)
  ip.split('.').map { |octet| format('%08b', octet.to_i) }.join(' ')
end

if __FILE__ == $PROGRAM_NAME 
#Common idiom in Ruby to determine if the script file is being run as a script
  if ARGV.length != 1
    puts "Usage: ./#{File.basename(__FILE__)} <IPv4 address>"
    exit
  end
  ip_address = ARGV[0]
  binary_ip = ip_to_binary(ip_address)
  puts binary_ip
end


