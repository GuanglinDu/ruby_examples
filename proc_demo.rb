# Created on Aug. 6, 2015 Thu.
# Class Proc: http://ruby-doc.org/core-2.2.0/Proc.html
# Proc objects are blocks of code that have been bound to a set of local variables.
# Once bound, the code may be called in different contexts and still access those
# variables.

# Returns a new Proc object
def gen_times(factor)
  return Proc.new { |n| n*factor } # n is the param of the block (vs the JS closure)
end

# Creates new Proc objects & binds them to the local variables
times3 = gen_times(3)
times5 = gen_times(5)

# Method call invokes the block, setting the block’s parameters to the values
#in params using something close to method calling semantics.
puts times3.call(12)                    #=> 36
puts times5.call(5)                      #=> 25
puts times3.call(times5.call(4)) #=> 60


# Creates a new Proc object, bound to the current context.
# Proc::new may be called without a block only within a method with an attached block,
# in which case that block is converted to the Proc object.
def proc_from
  Proc.new
end

proc = proc_from { "hello, Proc." }
puts proc.call #=> "hello, Proc"


# Added on Thu, Jul 4, 2019
# https://ruby-doc.org/core-2.6.2/Proc.html#method-i-yield
puts "\n--- Added on Thu, Jul 4, 2019"
a_proc = Proc.new {|scalar, *values| values.map {|value| value*scalar } }
puts a_proc.call(9, 1, 2, 3)   #=> [9, 18, 27]
puts a_proc[9, 1, 2, 3]          #=> [9, 18, 27]
puts a_proc.(9, 1, 2, 3)         #=> [9, 18, 27]
puts a_proc.yield(9, 1, 2, 3) #=> [9, 18, 27]
