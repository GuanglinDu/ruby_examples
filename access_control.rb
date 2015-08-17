# Access control demo
# @author Guanglin Du
# 2013/04/20 18:58:47

# Page 40, 3.3 Access Control, Programming Ruby 1.9 & 2.0 by Dave Thomas with Chad Fowler and Andy Hunt
# Ruby gives you three levels of protection:
# * Public methods can be called by anyone—no access control is enforced. Methods are
#   public by default (except for initialize, which is always private).
# * Protected methods can be invoked only by objects of the defining class and its subclasses.
#   Access is kept within the family. (internally in the implementation)
# * Private methods cannot be called with an explicit receiver—the receiver is always the
# current object, also known as self. This means that private methods can be called only
# in the context of the current object; you can’t invoke another object’s private methods.

# See also method_visibility.rb

class AccessControlDemo
  def method1 # default is 'public'
    puts "Method1 is public by default."
  end
  
  protected # subsequent methods will be 'protected'

  def method2 # will be 'protected'
    puts "Method2 is protected."
  end

  private # subsequent methods will be 'private'

  def method3 # will be 'private'
    puts "Method3 is private."
  end

  public # subsequent methods will be 'public'

  def method4 # and this will be 'public'
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


# A subclass can calls all the methods in it's superclass, internally
# See http://weblog.jamisbuck.org/2007/2/23/method-visibility-in-ruby
# Note that, unlike languages such as Java, inheritance plays absolutely no part in determining method visibility in Ruby.
# Subclasses can access both protected and private methods of the superclass without trouble,
# so long as they abide by the rules laid out above.
class MySubclass < AccessControlDemo
  def submethod1
    method1
    method2 # protected, OK
    method3 # private, OK
  end
end


# Calls the methods in objects
acd = AccessControlDemo.new
acd.method1
#acd.method2 #can only be called from within the definition or subclass definition
#acd.method3 # can only be called from within the definition
acd.method4

mc = MyClass.new
mc.method1

puts "--- In subclasses --"
msc = MySubclass.new
msc.method1

# NoMethodError, protected
begin
  #msc.method2  
  #msc.method3 # NoMethodError, private
rescue Exception
  raise
end

msc.method4

puts "--- Calls superclass' methods in a method of the subclass --"
msc.submethod1
