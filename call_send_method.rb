# Created on Mar 7, 2019 Thu.
# https://ruby-doc.org/core-2.1.3/Object.html#method-i-send

class Klass
  def initialize(n)
    @iv = n
  end
  
  def hello(*args)
    "Hello " + args.join(' ')
  end
  
  def hello2()
    puts "Hello, @iv = #{@iv}"
  end
end

k = Klass.new(99)
puts k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"
puts k.send "hello", "gentle", "readers" # same as above

m = k.method(:hello2)
# wrong number of arguments (3 for 1)
#m = k.method "hello", "gentle", "readers"
m.call
