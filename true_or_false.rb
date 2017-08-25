# Created on Aug. 4, 2015 Tue.
# Truth eveluation in Ruby

# Defines a method to evaluate the truth value
def evaluate(*arr)
  arr.each do |a|
    if a
      puts "#{a} is true in Ruby"
    elsif
      puts "#{a} is false in Ruby"
    end
  end
end

# True values
# The global value true is the only instance of class TrueClass and
# represents a logically true value in boolean expressions.
puts "--- true values ---"
evaluate 0, 1, [], {}, true 

# False values
# FalseClass
puts "\n--- false values ---"
evaluate nil, false