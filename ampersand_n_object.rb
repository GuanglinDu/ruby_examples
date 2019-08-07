# Created on Jan. 21, 2018 Sun.

# The ampersand and the object
# https://stackoverflow.com/questions/1961030/ruby-ampersand-colon-shortcut#1961118
# The colon in this case is for the symbol. 
# The & calls to_proc on the object, and passes it as a block to the method.
# In Rails, to_proc is implemented on Symbol, so that these two calls are equivalent:
# something { |i| i.foo }
# something(&:foo)

up# Also, to_proc on Symbol is implemented in Ruby 1.8.7 and 1.9, so it is in fact
# a "ruby thing".
# So, to sum up: & calls to_proc on the object and passes it as a block to the
# method, and Ruby implements to_proc on Symbol.

arr = ["a", "b", "c"].map(&:upcase)
arr.each { |e| print "#{e} " }

puts "\n--- The block form ---"
arr2 = arr.each { |i| i.upcase }
arr2.each { |e| print "#{e} " }

puts "\n--- The ampersand plus object form: symbol-to-proc ---"
arr3 = arr.each(&:upcase)
arr3.each { |e| print "#{e} " }
puts
