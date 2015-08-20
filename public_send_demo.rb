# 2015/01/18 10:51:55
# Object.public_send
# http://ruby-doc.org/core-2.2.0/Object.html#method-i-public_send
# Invokes the method identified by symbol, passing it any arguments specified.
# Unlike send, #public_send calls public methods only. When the method is identified by a string, the string is converted to a symbol.

class PublicSendDemo
  attr_accessor :name # getter & setter
  
  def initialize(name = "World")
    @name = name
  end
  
  def say_hello(s = "Globe")
    #self.name = s # OK. Calls the setter
    name = s # OK. Calls the setter
    #@name = s # OK. Assigns the instance variable directly
    puts "Hello, #{name}" # call the setter
    puts "Hello, #{@name}" # use the instance variable directly
  end
end

psd = PublicSendDemo.new
psd.public_send(:say_hello, 'Ruby')
