# Created on Aug. 14, 2015 Fri.
# What does send() do in Ruby?
# http://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby

# Compares: send vs public_send

# send is a ruby (without rails) method allowing to invoke another method by name.
puts "--- Invokes another method by name ---"
class Klass
  def hello(*args)
    "Hello " + args.join(' ')
  end
end

k = Klass.new
puts k.send :hello, "gentle", "readers" #=> "Hello gentle readers"


# One of the most useful feature I think with .send method is that it can dynamically call on method.
# This can save you a lot of typing. One of the most popular use of .send method is to assign attributes dynamically. For example:
puts "--- Calls on methods dynamically ---"
class Car
  attr_accessor :make, :model, :year
  
  def show_info
    puts self.make + ", " + self.model + ", " + self.year
  end
end

# To assign attributes regularly one would need to
c = Car.new
c.make = "Honda"
c.model = "CRV"
c.year = "2014"
c.show_info

# Or using .send method. Note the = mark.
c.send("make=", "Honda")
c.send("model=", "CRV")
c.send("year=","2014")
c.show_info

# But it can all be replaced with the following:
# Assuming your Rails app needs to assign attributes to your car class from user input, you can do
c2 = Car.new()
params = {make: 'Honda', model: 'SUV', year: '2015'}
params.each do |key, value|
  c2.send("#{key}=", value)
end
c2.show_info
