# A class is open as is a module
# 2013/05/31 10:08:26

require_relative 'class_is_open01'

# Opens ClassIsOpen01 & appends a new method
class ClassIsOpen01
  
  def say_something(sth)
    puts "say something: #{sth}"
  end
  
end

# Reopen it & adds one more method
class ClassIsOpen01

  def say_nothing
    puts "say nothing"
  end
  
end


puts "--- Ruby classes are open! ---"
cio = ClassIsOpen01.new

# Method from file class_is_open01.rb
puts "*** The original method"
cio.do_something :duckduckgodotcom

puts "\n*** Methods appended"
cio.say_something :hi
cio.say_nothing
