#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: ./#{$PROGRAM_NAME} /<subnet prefix>"
  exit
end

input = ARGV[0]
prefix = input.start_with?('/') ? input[1..].to_i : input.to_i

if prefix < 0 || prefix > 32
  puts "Invalid subnet prefix. Must be between 0 and 32."
  exit
end

def calculate_subnet_mask(prefix)
  binary_mask = '0' * 32
  binary_mask[0...prefix] = '1' * prefix
  octets = binary_mask.scan(/.{8}/)
  decimal_octets = octets.map { |octet| octet.to_i(2) }
  decimal_octets.join('.')
end

puts calculate_subnet_mask(prefix)
