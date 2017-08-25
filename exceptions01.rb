# Created on Aug. 16, 2015 Sun.
# Page 142, 10.2 Handling Exceptions, Programming Ruby 1.9 & 2.0
# by Dave Thomas with Chad Fowler and Andy Hunt

require 'open-uri'

page = "podcasts"
file_name = "#{page}.html"
web_page = open("http://pragprog.com/#{page}")
output = File.open(file_name, "w")

begin
  while line = web_page.gets
    output.puts line
  end
  output.close
rescue Exception
  STDERR.puts "Failed to download #{page}: #{$!}"
  output.close
  File.delete(file_name)
  raise
end
