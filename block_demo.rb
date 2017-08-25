# Created on Dec. 15, 2015 Tue.
# See http://rubylearning.com/satishtalim/ruby_blocks.html

=begin  
  Ruby Code blocks are chunks of code between braces or  
  between do-end that you can associate with method invocations  
=end  
def call_block  
  puts 'Start of method'  
  # you can call the block using the yield keyword  
  yield  
  yield  
  puts 'End of method'  
end  

# Code blocks may appear only in the source adjacent to a method call  
call_block {puts 'In the block'}  
# No block given will lead to this error
#call_block # no block given (LocalJumpError)


# You can provide parameters to the call to yield:  
# these will be passed to the block
puts "---\n Passing parameters to the block ---"
def call_block2 
  yield('hello', 99)  
end  
call_block2 { |str, num| puts str + ', ' + num.to_s } 


# A code block's return value (like that of a method) is the value of the last expression
# evaluated in the code block. This return value is made available inside the method; it
# comes through as the return value of yield.
puts "\n--- The block's return value ---"
def try  
  if block_given?  
    yield  
  else  
    puts "no block"  
  end  
end  
try # => "no block"  
try { puts "hello" } # => "hello"  
try do puts "hello" end # => "hello" 


puts "\n--- The block's variables ---"
x = 10  
result = 5.times do |x|
  puts "x inside the block: #{x}"  
end
# Returns self. See http://ruby-doc.org/core-2.2.2/Integer.html#method-i-times
puts "result = #{result}"
  
puts "x outside the block: #{x}"

x = 10  
5.times do |y|  
  x = y  
  puts "x inside the block: #{x}"  
end  
  
puts "x outside the block: #{x}"

# In Ruby 1.9, blocks introduce their own scope for the block parameters only.
puts "\n--- In Ruby 1.9, blocks introduce their own scope for the block parameters only"
x = 10  
5.times do |y; x|  
  x = y  
  puts "x inside the block: #{x}"  
end  
puts "x outside the block: #{x}"
