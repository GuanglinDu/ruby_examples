# Create on Aug. 11, 2015 Tue.
# Demonstrates how to create nested modules, use mixins,
# and append new members to an existing module as it's open

# Modules are namespaces in Ruby
# Layer 1
module A
  # A module method is defined as the class method
  # qualified with the module name. This method cannot be mixed in the class.
  #def A.say() # OK
  def A::say() # OK, too
    puts "Hello, module A."
  end
  
  # A module method is defined as the class method
  # qualified without the module name. can be mixed in the class.
  def do_it01() # without the module name
    puts "Hello, module A."
  end
  
  # Layer 2
  module B
    def B.say()
      puts "Hello, module B."
    end

    def do_it02() # without the module name
      puts "Hello, module B."
    end
  
    # A class in module B
    class Father
      def say_hi
      	  puts "Hi, father."
      end
    end
    
    # Layer 3
    module C
      def C.say()
        puts "Hello, module C."
      end
      
      def do_it03() # without the module name
        puts "Hello, module C."
      end

    end # C
  
  end # B
  
end # A

# Calls the module methods qualified with module names directly
puts "\n--- Use nested modules ---"
A::say
A.say # OK, too
A::B::say
A::B::C::say

# Module methods not qualified with the module name cannot be called directly
#A.do_it01 # illegal


# A subclass of Father
puts "\n--- A subclass of Father ---"
class Son < A::B::Father
end
son_a = Son.new
son_a.say_hi


# Mixes them in a class
require_relative "nested_module"
puts "\n--- Mixes in all the layers ---"
class TestMixin
  include A
  include A::B
  include A::B::C
	
  def initialize(name = "World")
    @name = name
  end
  
  def say_hi
    puts "Hi, #{@name}"
  end
end

tmi = TestMixin.new
tmi.say_hi
#tmi.say # illegal, cannot be mixed in
tmi.do_it01
tmi.do_it02
tmi.do_it03

# The module is open
puts "\n--- The module is open as is the class!!! ---"
module A::B::C
  def greet
    puts "I'm method greet"
  end
end

tmi.greet
