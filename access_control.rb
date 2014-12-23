# Access control demo
# @author Guanglin Du
# 2013/04/20 18:58:47

class AccessControlDemo
      def method1    # default is 'public'
		puts "Method1 is public by default."
      end
      
  protected          # subsequent methods will be 'protected'
      def method2    # will be 'protected'
        puts "Method2 is protected."
      end

  private            # subsequent methods will be 'private'
      def method3    # will be 'private'
        puts "Method3 is private."
      end

  public             # subsequent methods will be 'public'
      def method4    # and this will be 'public'
        puts "Method4 is specified as public."
      end

end

#############
# Alternatively, you can set access levels of named methods by listing them as arguments to the access control functions. 
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
  public    :method1, :method4
  
  protected :method2
  
  private   :method3
  
end

acd = AccessControlDemo.new
acd.method1
#acd.method2 #can only be called from within the definition or subclass definition
#acd.method3 # can only be called from within the definition
acd.method4

mc = MyClass.new
mc.method1

