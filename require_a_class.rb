# Shows how to use a class from a file
require_relative 'class_is_open01'

class MyClass
  def initialize
    @name = "World"
    @cio = ClassIsOpen01.new # object member
  end
  
  def do_something
    @cio.do_something @name
  end
  
  def setup
    @cio.setup
    puts "Hello, setup 2"
  end
end

mc = MyClass.new
mc.do_something
mc.setup
