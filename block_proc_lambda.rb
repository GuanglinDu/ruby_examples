# What Is the Difference Between a Block, a Proc, and a Lambda in Ruby?
# http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/
 
# Block Examples
puts "--- Bock examples"
[1, 2, 3].each { |x| puts x*2 } # block is in between the curly braces

[1, 2, 3].each do |x|
  puts x*2                              # block is everything between the do and end
end

# Proc Examples
puts "--- Proc examples"
p = Proc.new { |x| puts x*2 }
[1, 2, 3].each(&p)                   # The '&' tells ruby to turn the proc into a block 

proc = Proc.new { puts "Hello Proc" }
proc.call                               # The body of the Proc object gets executed when called

puts "--- Lambda examples"
# Lambda Examples            
lam = lambda { |x| puts x*2 }
[1, 2, 3].each(&lam)

lam = lambda { puts "Hello lambda" }
lam.call


# Differences between Blocks and Procs
puts "--- Differences between Blocks and Procs"

# 1. Procs are objects, blocks are not
p = Proc.new { puts "Hello world" }
p.call   # prints 'Hello World'
p.class # returns 'Proc'
a = p   # a now equals p, a Proc instance
p         # returns a proc object '#<Proc:0x007f96b1a60eb0@(irb):46>'

# 2. At most one block can appear in an argument list
# In contrast, you can pass multiple procs to methods.
def multiple_procs(proc1, proc2)
  proc1.call
  proc2.call
end

a = Proc.new { puts "First proc" }
b = Proc.new { puts "Second proc" }

multiple_procs(a,b)


# Differences between Procs and Lambdas
puts "--- Differences between Procs and Lambdas"
proc = Proc.new { puts "Hello Proc" }
lam = lambda { puts "Hello lambda" }

# Both are Proc objects
proc.class # returns 'Proc'
lam.class  # returns 'Proc'

# Lambdas are a different ‘flavor’ of procs
puts proc   # returns '#<Proc:0x007f96b1032d30@(irb):75>'
puts lam    # returns '<Proc:0x007f96b1b41938@(irb):76 (lambda)>'

# 1. Lambdas check the number of arguments, while procs do not
lam = lambda { |x| puts x } # creates a lambda that takes 1 argument
lam.call(2)                           # prints out 2
#lam.call                              # ArgumentError: wrong number of arguments (0 for 1)
#lam.call(1,2,3)                   # ArgumentError: wrong number of arguments (3 for 1)

# In contrast, procs don’t care if they are passed the wrong number of arguments.
proc = Proc.new { |x| puts x } # creates a proc that takes 1 argument
proc.call(2)                              # prints out 2
proc.call                                   # returns nil
proc.call(1,2,3)                        # prints out 1 and forgets about the extra arguments

# 2. Lambdas and procs treat the ‘return’ keyword differently
# ‘return’ inside of a lambda triggers the code right outside of the lambda code
def lambda_test
  lam = lambda { return }
  lam.call
  puts "Hello world"
end

lambda_test # calling lambda_test prints 'Hello World'
# ‘return’ inside of a proc triggers the code outside of the method where
# the proc is being executed
def proc_test
  proc = Proc.new { return }
  proc.call
  puts "Hello world"
end

proc_test # calling proc_test prints nothing


# Closures
puts "--- Closures"
# Example of Proc objects preserving local context
def counter
  n = 0
  return Proc.new { n += 1 }
end

a = counter
puts a.call            # returns 1
puts a.call            # returns 2

b = counter
puts b.call            # returns 1

puts a.call            # returns 3

# Summary Differences
# 1. Procs are objects, blocks are not
# 2. At most one block can appear in an argument list
# 3. Lambdas check the number of arguments, while procs do not
# 4. Lambdas and procs treat the ‘return’ keyword differently
