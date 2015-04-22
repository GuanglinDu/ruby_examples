# Blocks and Iterators.
# Jun. 16, 2009

def three_times
  yield
  yield
  yield  
end

def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end

#Writing iterators
def f(count, &block)
  value = 1
  1.upto(count) do |i|
    value = value * i
    block.call(i, value)
  end
end

#Block example
puts "\n--- Block demo 1 ---\n"
three_times { puts "Hello"}
call_block { puts "In the block" }

f(5) do |i, f_i|
  puts "f(#{i}) = #{f_i}"
end

#2nd block example from Programming Ruby, 1st edition.
puts "\n--- Block demo 2 ---\n"
def call_block
  yield
  yield
end
call_block { puts "In the block" }

def fib_up_to(max)
  i1, i2 = 1, 1 #parallel assignment
  while i1 <= max
    yield i1
    i1, i2 = i2, i1+i2
  end
end

fib_up_to(1000) { |f| print f, " " }

#3nd block example from Programming Ruby, 1st edition.
puts "\n--- Block demo 3 ---\n"
a = %w( ant bee cat dog elk )
a.each { |animal| puts animal }

#4th block demo
puts "\n--- Block demo 4 ---\n"
5.times {  print "*" }
3.upto(6) {|i|  print i }
('a'..'e').each {|char| print char }
puts "\n"

puts "\n--- I/O demo 4 ---\n"
printf "Number: %5.2f, String: %s", 1.23, "hello"
print "\n"
