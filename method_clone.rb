# Created on Apr 27, 2015 Mon
# Showcases method clone of class Object
# See http://ruby-doc.org/core-2.2.0/Object.html#method-i-clone
class Klass
  attr_accessor :str
end

s1 = Klass.new  #=> #<Klass:0x401b3a38>
s1.str = "Hello"  #=> "Hello"

s2 = s1.clone     #=> #<Klass:0x401b3998 @str="Hello">
s2.str[1, 4] = "i" #=> "i"

puts s1.inspect   #=> "#<Klass:0x401b3a38 @str=\"Hi\">"
puts s2.inspect   #=> "#<Klass:0x401b3998 @str=\"Hi\">"

puts s1.str
puts s2.str
