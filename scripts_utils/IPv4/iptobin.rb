#!/usr/bin/env ruby

def valid_ip?(ip)
  !!ip.match(/\A(\d{1,3}\.){3}\d{1,3}\z/) && ip.split('.').map(&:to_i).all? { |octet| octet.between?(0,255) }
end

def ip_to_binary(ip)
  return 'Invalid IP address format.' unless valid_ip?(ip)
  ip.split('.').map { |octet| format('%08b', octet.to_i) }.join(' ')
end

def get_ip_class(ip)
  first_octet = ip.split('.')[0].to_i
  case first_octet
  when 0..127
    'Class A'
  when 128..191
    'Class B'
  when 192..223
    'Class C'
  when 224..239
    'Class D (multicast)'
  when 240..255
    'Class E (Reserved)'
  else
    'Unknown Class'
  end
end

if __FILE__ == $PROGRAM_NAME 
#Common idiom in Ruby to determine if the script file is being run as a script
  if ARGV.length != 1
    puts "Usage: ./#{File.basename(__FILE__)} <IPv4 address>"
    exit
  end
  ip_address = ARGV[0]
  binary_ip = ip_to_binary(ip_address)
  ip_class = get_ip_class(ip_address)
  puts ip_class
  puts binary_ip
end


