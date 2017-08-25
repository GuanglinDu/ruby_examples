# See http://goo.gl/XOBw85
class Foo
  def foo
    puts "In the parent class:"
    "#{self.class}#foo"    
  end
  
  def say_hi
    puts "Hi from the super class"
  end
end

# Overrides and call the parent methods at the same time
class Bar < Foo
  def foo
    puts "In the childe class:"
    "Super says: #{super}"
  end
  
  def say_hi
    super
  end
end

puts Foo.new.foo # => "Foo#foo"

bar01 = Bar.new
puts bar01.foo # => "Super says: Bar#foo"
bar01.say_hi
