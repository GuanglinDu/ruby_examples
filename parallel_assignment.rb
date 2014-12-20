# 2014/12/20 10:16:31
# See http://codeofpractice.blogspot.com/2010/05/parallel-assignment-in-ruby.html

x, y = 1, 2 # => x = 1, y = 2
puts "x = #{x}, y = #{y}"

# In fact, the right values are regarded as an array so the above statement is equivalent to:
x, y = [1, 2]
puts "x = #{x}, y = #{y}"

x, y = 11.divmod(3)
puts "x = #{x}, y = #{y}"

# Class Numeric
arr = 11.divmod(3) # returns an Array object
puts "arr is #{arr.class}"
x, y = arr
puts "x = #{x}, y = #{y}"

# Chain assignment
a, b = (x, y = 1, 2) # => a = x = 1, b = y = 2
puts "a = x = #{x}, b = y = #{y}"
puts "a = x = #{a}, b = y = #{b}"

# Swaps x and y
y, x = x, y # => x = 2, y = 1
puts "After swap: x = #{x}, y = #{y}"

# You can also return multiple values from a method for parallel assignment
def test
  return 3, 4
end
x, y = test # => x = 1, y = 2
puts "x = #{x}, y = #{y}"
