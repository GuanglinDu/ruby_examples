# 2015/01/17 13:28:11
# The same nested parent and child class names

class NestedClassDemo
  def initialize(name = 'World')
    @name = name
  end

  def do_something
    puts "Hello, NestedClassDemo: #{@name}"
  end
  
  class Scope
    def initialize(name = 'Nested World')
      @name = name
    end

    def do_something
      puts "Hello, #{@name}"
    end
  end
end

# Subclasses
class SubnestedClass < NestedClassDemo
  class Scope < Scope # use the same class name is OK
    def initialize(name = 'subscope World')
      @name = name
    end

    def do_something
      puts "Hello 2, #{@name}"
    end
  end
end

# A subclass of the nested class Scope
class MyScope < NestedClassDemo::Scope
end

scope = NestedClassDemo::Scope.new
scope.do_something

scope2 = SubnestedClass::Scope.new
scope2.do_something

ms = MyScope.new("MyScope")
ms.do_something
