# Created on Aug. 14, 2015 Fri.
# Method eval in Ruby
# http://ruby-doc.org/core-2.2.0/Binding.html#method-i-eval

# eval(string [, filename [,lineno]]) → obj
# Evaluates the Ruby expression(s) in string, in the binding’s context.
# If the optional filename and lineno parameters are present, they will be used when reporting syntax errors.
def get_binding(param)
  return binding
end
b = get_binding("hello")
puts b.eval("param")   #=> "hello" # eval in the method context


# http://stackoverflow.com/questions/8261588/ruby-pass-variable-to-eval-method
# This should work for you
def myvariable(foo)
  return "hello #{foo}"
end

a_test = "myvariable"
eval "puts #{a_test}('world')" # eval in the global context
#=> hello world

# In ruby though, it would be more appropriate to do something like this
def myvariable(foo)
  return "hello #{foo}"
end

a_test = "myvariable"
puts send(a_test, 'world')
#=> hello world
# Read more about send (in method_send.rb).