#!/usr/bin/env ruby

# Function to validate the IP address and prefix length
def valid_ip_and_prefix?(ip_with_prefix)
  ip, prefix_length = ip_with_prefix.split('/')
  valid_ip = !!ip.match(/\A(\d{1,3}\.){3}\d{1,3}\z/) && ip.split('.').map(&:to_i).all? { |octet| octet.between?(0, 255) }
  valid_prefix = prefix_length.to_i.between?(0, 32)
  valid_ip && valid_prefix
end

# Function to convert IP address to binary
def ip_to_binary(ip)
  ip.split('.').map { |octet| format('%08b', octet.to_i) }.join(' ')
end

# Function to calculate the subnet mask from the prefix length
def subnet_mask_from_prefix_length(prefix_length)
  mask_bits = '1' * prefix_length.to_i + '0' * (32 - prefix_length.to_i)
  mask_bits.scan(/.{8}/).map { |octet| octet.to_i(2) }.join('.')
end

# Function to compute the network address by performing bitwise AND
def network_address(ip, mask)
  ip_octets = ip.split('.').map(&:to_i)
  mask_octets = mask.split('.').map(&:to_i)
  network_octets = ip_octets.zip(mask_octets).map { |ip_octet, mask_octet| ip_octet & mask_octet }
  network_octets.join('.')
end

# Function to determine the class of the IP address
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
    'Class D (Multicast)'
  when 240..255
    'Class E (Reserved)'
  else
    'Unknown Class'
  end
end

# Main execution block
if __FILE__ == $PROGRAM_NAME
  if ARGV.length != 1 || !valid_ip_and_prefix?(ARGV[0])
    puts "Usage: #{File.basename(__FILE__)} <IPv4 address>/<prefix length>"
    exit
  end

  ip_with_prefix = ARGV[0]
  ip_address, prefix_length = ip_with_prefix.split('/')
  binary_ip = ip_to_binary(ip_address)
  subnet_mask = subnet_mask_from_prefix_length(prefix_length)
  binary_subnet_mask = ip_to_binary(subnet_mask)
  network_addr = network_address(ip_address, subnet_mask)
  binary_network = ip_to_binary(network_addr)
  ip_class = get_ip_class(ip_address)
  
  puts "IP Address: #{ip_address}"
  puts "Binary IP:   #{binary_ip}"
  puts "Subnet Mask: #{subnet_mask}"
  puts "Binary Mask: #{binary_subnet_mask}"
  puts "Network Address: #{network_addr}"
  puts "Binary Network:  #{binary_network}"
  puts "IP Class: #{ip_class}"
end
