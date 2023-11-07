#!/usr/bin/env ruby

require 'ipaddr'

# Function to convert the subnet mask to prefix length
def mask_to_prefix(mask)
  IPAddr.new(mask).to_i.to_s(2).count("1")
end

# Function to calculate network, usable host addresses, and broadcast addresses
def calculate_addresses(ip, mask)
  ip_with_prefix = IPAddr.new("#{ip}/#{mask_to_prefix(mask)}")
  network = ip_with_prefix.to_range.first
  broadcast = ip_with_prefix.to_range.last
  usable_hosts = ip_with_prefix.to_range.to_a[1...-1] # Exclude network and broadcast addresses
  [network, usable_hosts, broadcast]
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length != 2
    puts "Usage: #{File.basename(__FILE__)} <IPv4 address> <Subnet Mask>"
    exit
  end

  ip_address = ARGV[0]
  subnet_mask = ARGV[1]
  network, hosts, broadcast = calculate_addresses(ip_address, subnet_mask)

  puts "Network Address:"
  puts network.to_s

  puts "\nUsable Host IP Addresses:"
  hosts.each do |host|
    puts host.to_s
  end

  puts "\nBroadcast Address:"
  puts broadcast.to_s
end
