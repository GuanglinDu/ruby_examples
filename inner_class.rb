# An inner class demo
# http://stackoverflow.com/questions/14739640/ruby-classes-within-classes-or-modules-within-modules

class Outerclass
  def foobar
    puts "In the outerclass"
  end

  class Innerclass   
    def barfoo
      puts "In the inner class"
    end
  end
end

oc = Outerclass.new
oc.foobar
puts "The instance methods: " \
        "#{Outerclass.instance_methods(false)}" # => [:foobar]


# Use the scope operator to access the inner class as is the case in a module
ic = Outerclass::Innerclass.new
ic.barfoo
puts format("The instance methods: %s",
                    Outerclass::Innerclass.instance_methods(false))
# => [:barfoo]
