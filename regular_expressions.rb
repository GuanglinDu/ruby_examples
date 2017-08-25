# Oct. 28, 2014 Wed.
# 7. Regular Expressions, Programming Ruby 3rd Edition for ruby 1.9 and 2.0

str = "cat and dog"

if str =~ /cat/
  puts "There's a cat here somewhere"
end

# Matches: =~
File.foreach("test.txt").with_index do |line, index|
  puts "#{index}: #{line}" if line =~ /on/
end

# Doesn't match: !~
File.foreach("test.txt").with_index do |line, index|
  puts "#{index}: #{line}" if line !~ /on/
end

# http://goo.gl/glu6M9
# The backticks execute the command and return the output as a string.
def running?
  str = `ps aux|grep thin`
  #str =~ /thin\s+server|/i ? true : false
  str =~ /thin server/i
end

puts running?
