# Created on Aug. 14, 2015 Fri.
# Method visibility in Ruby
#
# http://weblog.jamisbuck.org/2007/2/23/method-visibility-in-ruby
# * The protected keyword puts a straitjacket around the method.
# Any method declared protected may only be called if the receiver is self, explicitly or implicitly.
# (Update: protected methods may actually be called any time the receiver is of the same class as ‘self’...
# and an explicit self as receiver is just a specific case of that.)
# * Lastly, the private keyword is the tightest setting of all. 
# A private method cannot be called with an explicit receiver at all, even if that receiver is “self”.

# See also access_control.rb

class Foo
  def a
    #puts "Hi, I'm method a."
  end

  # Calls 'a' with explicit 'self' as receiver
  def b
    self.a
  end

  # Calls 'a' with implicit 'self' as receiver
  def c
    a
  end
end

# Note method eval
def safe_send(receiver, method, message)
  # can't use 'send' because it bypasses visibility rules
  eval "receiver.#{method}"
  rescue => e
    puts "#{message}: #{e}"
  else
    puts "#{message}: succeeded"
end

# Uses method public, protected and private to change the access control of method a
visibility = ARGV.shift || "public" # Array.shift
Foo.send(visibility, :a)

foo = Foo.new
safe_send(foo, :a, "explicit receiver       ")
safe_send(foo, :b, "explicit 'self' receiver")
safe_send(foo, :c, "implicit 'self' receiver")

# ruby ./method_visibility.rb public
# ruby ./method_visibility.rb protected
# ruby ./method_visibility.rb private