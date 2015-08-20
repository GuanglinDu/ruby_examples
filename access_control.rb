# Access control demo
# @author Guanglin Du
# 2013/04/20 18:58:47

# Page 40, 3.3 Access Control, Programming Ruby 1.9 & 2.0 by Dave Thomas with Chad Fowler and Andy Hunt
# Ruby gives you three levels of protection:
# * Public methods can be called by anyone—no access control is enforced. Methods are
#   public by default (except for initialize, which is always private).
# * Protected methods can be invoked only by objects of the defining class and its subclasses.
#   Access is kept within the family (internally in the implementation).
# * Private methods cannot be called with an explicit receiver—the receiver is always the
# current object, also known as self. This means that private methods can be called only
# in the context of the current object; you can’t invoke another object’s private methods.

# See also method_visibility.rb
# Excerpts from http://weblog.jamisbuck.org/2007/2/23/method-visibility-in-ruby
# * The protected keyword puts a straitjacket around the method.
# Any method declared protected may only be called if the receiver is self, explicitly or implicitly.
# (Update: protected methods may actually be called any time the receiver is of the same class as ‘self’...
# and an explicit self as receiver is just a specific case of that.)
# * Lastly, the private keyword is the tightest setting of all. 
# A private method cannot be called with an explicit receiver at all, even if that receiver is “self”.

class AccessControlDemo
  # Default is 'public'
  def method1
    puts "Method1 is public by default."
  end
  
  # Subsequent methods will be 'protected'
  protected

  def method2
    puts "Method2 is protected."
  end

  # Subsequent methods will be 'private'
  private

  def method3
    puts "Method3 is private."
  end

  # Subsequent methods will be 'public'
  public

  def method4
    puts "Method4 is specified as public."
  end
end


# Alternatively, you can set access levels of named methods
# by listing them as arguments to the access control functions. 
class MyClass
  def method1
    puts "Method1 is specified as public."
  end
  
  def method2
    puts "Method2 is specified as protected."
  end
  
  def method3
    puts "Method3 is specified as private."
  end

  def method4
    puts "Method4 is specified as public."
  end

  # ... and so on
  public :method1, :method4
  
  protected :method2
  
  private   :method3
end


# A subclass can call all the public, protected and private methods in it's superclass, internally.
# See http://weblog.jamisbuck.org/2007/2/23/method-visibility-in-ruby
# Note that, unlike languages such as Java, inheritance plays absolutely no part in determining method visibility in Ruby.
# Subclasses can access both protected and private methods of the superclass without trouble,
# so long as they abide by the rules laid out above.
class MySubclass < AccessControlDemo
  def submethod1
    method1
    method2 # call a protected, OK
    method3 # call a private, OK
  end
end


# Calls the methods in objects
acd = AccessControlDemo.new
acd.method1
# The protected can only be called from within the definition or subclass definition (within the family)
#acd.method2
# The private can only be called from within the definition
#acd.method3
acd.method4

puts "\n--- Uses public, protected, private methods to specify the access control --"
mc = MyClass.new
mc.method1

puts "\n--- In subclasses --"
msc = MySubclass.new
msc.method1

# NoMethodError, protected & private
begin
  #msc.method2
  #msc.method3
rescue Exception
  raise
end

msc.method4

puts "\n--- Calls superclass' methods in a method of the subclass --"
msc.submethod1
