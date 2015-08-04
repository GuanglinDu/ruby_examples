#!/usr/bin/ruby
#Jun. 12, 2009

def hello(programmer)
  puts "Hello #{programmer}"
end

# Creating a class is easy
class LoveRuby
  # Function with its default argument value
  def hello(programmer = "Brian")
    puts "Hello, #{programmer}"
  end
 
  # There're 2 ways to create class methods (vs static functions in C++)
  # Way1: Defines a class method by prepending the class name
  def LoveRuby.say_hi
    puts "Hi, I'm class method say_hi (vs C++ static function)"
  end

  # Way 2: Defines another class method by prepending keyword self (vs C++ this)
  def self.say_hi2
    puts "Hi, I'm class method say_hi2, too"
    # Calls a class method from within this class method
    say_hi
    # or
    self.say_hi
    # or
    LoveRuby.say_hi
  end
end

hello('function')
hello('Barak Obama')

lr = LoveRuby.new # new is a class method to create objects
lr.hello

# Can only call the class methods by qualifying the class name. If called from its object,
# an exception will be raised
# In C++, the static class memebers can be called either from the class name directly
# or from its objects.
# lr.say_hi:  cannot work in an object, different from C++
puts "--- Call the class methods ---"
LoveRuby.say_hi
LoveRuby.say_hi2 # lr.say_hi2  cannot work, too
