# See Chapter 8 More About Methods, Programming Ruby 1.9 & 2.0 by Dave Thomas with Chad Fowler and Andy Hunt.

# Variable-Length Argument List using asterisk * 
# *rest is an Array object & optional
puts "---  Variable-Length Argument List ---"
def varargs(arg1, *rest)
  # puts "rest.class = #{rest.class}"
  "Got #{arg1} and #{rest.join(', ')}"
end

puts varargs("one") # "Got one and " (*rest is optional)
puts varargs("one", "two") # "Got one and two"
puts varargs "one", "two", "three" # "Got one and two, three"

# The Array entry, a single one, can be a Hash object
# Before 1.9, the Hash form
puts varargs "one", :two => 2, :three => 3, :four => 4
# Above 1.9
puts varargs "one", two: 2, three: 3, four: :dugl


# Methods and Blocks
puts "\n--- Methods and Blocks ---"
def double(p1)
  yield(p1*2)
end
double(3) {|val| puts "I got #{val}"}
double("tom") {|val| puts "Then I got #{val}"}

# However, if the last parameter in a method definition is prefixed with an ampersand, any
# associated block is converted to a Proc object (see proc_demo.rb),
# and that object is assigned to the parameter. This allows you to store the block for use later.
class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block # parallel assignment
  end
	
  def get_tax(amount)
    "#@name on #{amount} = #{ @block.call(amount) }" # attention: #@name without braces
  end
end

tc = TaxCalculator.new("Sales tax") {|amt| amt * 0.075 }
puts tc.get_tax(100) # => "Sales tax on 100 = 7.5"
puts tc.get_tax(250) # => "Sales tax on 250 = 18.75"
