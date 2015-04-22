# A class is open as is a module
# 2013/05/31 10:08:26

require './class_is_open02'

class ClassIsOpen01
  
  def saySomething(sth)
    puts "saySomething: #{sth}"
  end
  
end

# Reopen a class & add a new method
class ClassIsOpen01
  def sayNothing
    puts "sayNothing"
  end
end

cio = ClassIsOpen01.new
cio.saySomething :hi
cio.sayNothing

# Appended from file class_is_open02
cio.doSomething :duckduckgodotcom
