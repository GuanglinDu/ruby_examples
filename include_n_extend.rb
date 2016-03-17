# Dec. 11, 2015 Fri.
# See http://stackoverflow.com/questions/156362/what-is-the-difference-between-include-and-extend-in-ruby

# include: mixes in specified module methods as instance methods in the target class
# extend: mixes in specified module methods as class methods in the target class

module ReusableModule
  def module_method
    puts "Module Method: Hi there!"
  end
end

class ClassThatIncludes
  include ReusableModule
end

class ClassThatExtends
  extend ReusableModule
end

puts "Include: converting the specified module methods to instance methods"
ClassThatIncludes.new.module_method # "Module Method: Hi there!"

puts "Extend: converting the specified module methods to class methods"
ClassThatExtends.module_method # "Module Method: Hi there!"
