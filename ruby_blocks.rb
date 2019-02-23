# Created on Feb. 22, 2019 Fri.
# https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/

def print_once
  yield
end
print_once { puts "Block is being run" } # Implicit Blocks

def one_two_three
  yield 1
  yield 2
  yield 3
end
one_two_three { |number| puts number * 10 } # Implicit Blocks
# 10, 20, 30

# Implicit vs Explicit Blocks
def explicit_block(&block)
  block.call # same as yield
end
explicit_block { puts "Explicit block called" }

def do_something_with_block
  return "No block given" unless block_given?
  yield
end
puts do_something_with_block


# Lambda
say_something = -> { puts "This is a lambda" }
say_something.call
# "This is a lambda"

# Other ways to call a lambda
my_lambda = -> { puts "Lambda called" }
my_lambda.call
my_lambda.()
my_lambda[]
my_lambda.===

times_two = ->(x) { x * 2 }
times_two.call(10)
# 20

# Lambdas vs Procs
# Procs are a very similar concept…
# One of the differences is how you create them.
# There is no dedicated Lambda class. A lambda is just a special Proc object.
my_proc = Proc.new { |x| puts "x = #{x}" }
my_proc.call(10)
#puts my_proc.methods
puts my_proc.lambda?

# Closures
def call_proc(my_proc)
  count = 500
  my_proc.call
end

count   = 1
my_proc = Proc.new { puts count }
p call_proc(my_proc) # What does this print? 1
