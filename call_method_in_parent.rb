class Foo
  def foo
    "#{self.class}#foo"
  end
  
  def say_hi
    puts "Hi from the super class"
  end
end

class Bar < Foo
  def foo
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