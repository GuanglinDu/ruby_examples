# 2015/01/18 10:51:55
# Object.public_send
# http://ruby-doc.org/core-2.2.0/Object.html#method-i-public_send
# Invokes the method identified by symbol, passing it any arguments specified.
# Unlike send, #public_send calls public methods only. When the method is identified by a string, the string is converted to a symbol.

class PublicSendDemo
  attr_accessor :name
  
  def initialize(name = "World")
    @name = name
  end
  
  def say_hello(s = "Globe")
    #self.name = s
    #name = s
    @name = s
    puts "Hello, #{name}"
  end
end

psd = PublicSendDemo.new
psd.public_send(:say_hello, 'Ruby')
