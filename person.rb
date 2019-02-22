#!/usr/bin/ruby
#Jun. 12, 2009

# Method initialize is NOT a must
class Person
  # Initializes with the default value World vs C++ constructor
  #def initialize(name = "World")
  def initialize(name = 'World') #same as above
    @name = name # an instance variable
  end
  
  def greet
    "Hello, my name is #{@name}." # references the instance variable
  end
  
  # Returns something
  # The value returned by a Ruby method is the value of the last expression evaluated,
  # so we can get rid of the return statement altogether. 
  def greet2(name)
    result = "Good night, #{name.capitalize}"
    return result #can be omitted as 
  end

  # Simplified form of function greet2
  def greet3(name)
    "Good night, #{name.capitalize}"
  end
end

#### Subclass definition ######
class Matz < Person
  def initialize
    super('Yukihiro Matsumoto')
  end
end

# Play with the base class
puts "--- The base class ---\n"
aPerson = Person.new #default initialization
puts aPerson.greet
#brian = Person.new('Brian') #OK
#brian = Person.new("Brian") #OK
#brian = Person.new 'Brian' #OK
#brian = Person.new :Brian #OK, symbol
brian = Person.new(:Brian) #OK, symbol
puts brian.greet

puts "--- The subclass ---\n"
puts Matz.new.greet
puts Matz.new.greet3("dugl")
