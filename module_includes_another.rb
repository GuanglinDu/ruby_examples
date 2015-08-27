# Created on Aug. 27, 2015 Thu.
# A module inclues another one.
# http://stackoverflow.com/questions/4914913/how-do-i-include-a-module-into-another-module-refactor-aasm-code-and-custom-sta

require_relative 'module02'

module Bmodule
  def greet
    puts 'hello world'
  end
end

module Amodule
  include Bmodule
end

# Mixes the module in
class MyClass
  include Amodule
  include AntGame # module02.rb
  
  def say_hello
    puts "Hello, module including."
  end
end

mc = MyClass.new
mc.greet # => hello world
mc.say_hello

# Calls a method in module AntGame
a, b = 1, 2
puts "#{a} + #{b } = #{mc.sum(1, 2)}"
