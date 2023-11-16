# Hiding setup and cleanup in a block method
# Problem:
# You have a setup method that always needs to run before custom code,
# or a cleanup method that needs to run afterwards. You don't trust the person
# writing the code (possibly yourself) to remember to call the setup and cleanup methods

def between_setup_and_cleanup
  # Pseudo code
  # setup
  # begin
  #   yield
  # finally
  #   cleanup
  # end
end

# Concrete example, HTML setup document.
def write_html(out, doctype=nil)
  doctype ||= %(<!DOCTYPE HTML PUBLIC "-//W3C/DTD HTML 4.01 Transitional//EN"
              "http://www.w3.org/TR/html14/loose.dtd">)
  out.puts doctype
  out.puts '<html>'
  begin
    yield out
  ensure
    out.puts '</html>'
  end
end

write_html($stdout) do |out|
  out.puts '<h1>Sorry, the Web is closed.</h1>'
end

# Same example using  CGI
require 'cgi'
c = CGI.new("html4")
c.out do
  c.html do
    c.h1 { 'Sorry, the Web is closed.' }
  end
end
# <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
# "http://www.w3.org/TR/html4/strict.dtd">
# <HTML><H1>Sorry, the Web is closed.</H1></HTML>

# XmlMarkup with builder gem
require 'rubygems'
require 'builder'
xml = Builder::XmlMarkup.new.message('type' => 'apology') do |b|
  b.content('Sorry, Web services are closed.')
end
puts xml
# <message type="apology">
#  <content>Sorry, Web Services are closed.</content>
# </message>