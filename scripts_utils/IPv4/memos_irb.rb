# Give the network address by applying a subnet mask to an IP address

p "172.16.1.116".split('.').map(&:to_i).zip("255.255.254.0".split('.').map(&:to_i)).map { |ip,mask| ip & mask }
