# Created on 20190701
# Understanding `self` in Ruby https://www.honeybadger.io/blog/ruby-self-cheat-sheet/

puts "-- Self points to the class or module that's in the process of being defined"
class Ghost
  def reflect
    self
  end
end

g = Ghost.new
puts g.reflect == g # => true

puts "-- Class method in a class"
class Ghost2
  def self.reflect
    self
  end
end

puts Ghost2.reflect == Ghost2 # => true

#  Classes and modules are treated as objects in Ruby
puts "-- Class method in a module"
module Ghost3
  def self.reflect
    self
  end
end 
puts Ghost3.reflect == Ghost3 # => true


puts "--- self points to the class or module that's in the process of being defined"
class Ghost4
  puts self == Ghost4 # => true
end 

module Mummy
  puts self == Mummy # => true
end

