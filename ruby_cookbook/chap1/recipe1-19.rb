# Validating an Email Address

def probably_valid?(email)
  valid = '[A-Za-z\d.+-]+' 
  (email =~ /#{valid}@#{valid}\.#{valid}/) == 0
end

puts probably_valid? 'joe@example.com'
puts probably_valid? 'joe+ruby-mail@example.com'
puts probably_valid? 'joe.bloggs@mail.example.com'
puts probably_valid? 'joe@examplecom'
puts probably_valid? 'joe+ruby-mail@example.com'
puts probably_valid? 'joe@localhost'

# This address is valid, but probably_valid thinks it'not
puts probably_valid? 'joe(and-mary)@example.museum'
# This adress is valid, but certainly wrong
puts probably_valid? 'joe@example.cpm'

# DNS lookup

require 'resolv'
def valid_email_host?(email)
  hostname = email[(email =~ /@/)+1..email.length]
  valid = true
  begin
    Resolv::DNS.new.getresource(hostname,Resolv::DNS::Resource::IN::MX)
  rescue Resolv::ResolvError
    valid = false
  end
  return valid
end

puts valid_email_host?('joe@gfhjgdgu.mil')
puts valid_email_host?('joe@oreilly.com')
