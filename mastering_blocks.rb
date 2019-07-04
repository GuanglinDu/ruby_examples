# Created on Dec. 17, 2015 Thu.
# See http://mixandgo.com/blog/mastering-ruby-blocks-in-less-than-5-minutes

# Outputs the elements of an Array
puts "--- do...end"
[1, 2, 3].each do |n|
  puts "Number #{n}"
end

# An inline block
puts "--- onliner"
[1, 2, 3].each { |n| puts "Number #{n}" }

# How yield works: Keyword yield
puts "\n--- How yield works: Keyword yield"
def my_method
  puts "reached the top"
  yield
  puts "reached the bottom"
end

my_method do
  puts "reached yield"
end

# call vs yield
puts "\n---call vs yield---"
def my_method(&block)
  puts block
  block.call
end

my_method { puts "Hello!" }

# Yield takes parameters too
puts "\n---Yield takes parameters too---"
def my_method2
    yield("John", 2)
end

my_method2 do |name, age|
  puts "#{name} is #{age} years old"
end


# Return value
puts "\n---Return value---"
def my_method3
    value = yield
    puts "value is: #{value}"
end

my_method3 do
  2
end

# .map(&:something)
puts "\n---.map(&:something)---"
def list_array(arr)
  arr.each{ |e| puts e }
end
a1 = ['abc', 'def']
a2 = a1.map(&:capitalize)
list_array(a2)

a3 = a1.map { |e| e.capitalize }
list_array(a3)

a4 = a1.map { |e| e.upcase }
list_array(a4)


# Iterators and how to build one yourself
puts "\n---Iterators and how to build one yourself---"
def my_map(array)
  new_array = []

  for element in array
    new_array.push yield element
  end

  i = 0
  new_array.each do |e|
    puts "new_array[#{i}] = #{e}"
    i += 1
  end
end

my_map([1, 2, 3]) do |number|
  number * 2
end


# Initialize objects with default values
puts "\n---Initialize objects with default values---"
class Car
  attr_accessor :color, :doors

  def initialize
    yield(self)
  end
end

car = Car.new do |c|
  c.color = "Red"
  c.doors = 4
end

puts "My car's color is #{car.color} and it's got #{car.doors} doors."


# Wrap text in html tags
puts "\n---Wrap text in html tags---"
def wrap_in_h1
  "<h1>#{yield}</h1>"
end

puts wrap_in_h1 { "Here's my heading" }
# => "<h1>Here's my heading</h1>"
puts wrap_in_h1 { "Ha" * 3 }
# => "<h1>HaHaHa</h1>"

def wrap_in_tags(tag, text)
  html = "<#{tag}>#{text}</#{tag}>"
  yield html
end

wrap_in_tags("title", "Hello") { |html| puts html }
wrap_in_tags("title", "Hello") { |html| puts :body => html }


# Take a note
puts "\n---Take a note---"
class Note
  attr_accessor :note

  def initialize(note=nil)
    @note = note
    puts "@note is #{@note}"
  end

  def self.create
    self.connect
    note = new(yield)
    note.write
    self.disconnect
  end

  def write
    puts "Writing \"#{@note}\" to the database."
  end

private

  def self.connect
    puts "Connecting to the database..."
  end

  def self.disconnect
    puts "Disconnecting from the database..."
  end
end

Note.create { "Foo" }


# Find divisible elements of an array
puts "\n---Find divisible elements of an array---"
class Fixnum # Ruby class is open!
  def to_proc
    Proc.new do |obj, *args|
      obj % self == 0 # true or false
    end
  end
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select(&3)
puts numbers


# Array.select. See http://ruby-doc.org/core-2.2.2/Array.html#method-i-select
puts "\n---Array.select---"
a1 = [1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]
puts a1

# See http://stackoverflow.com/questions/5781362/ruby-operator
# The =~ operator matches the regular expression against a string,
#and it returns either the offset of the match from the string if it is found, otherwise nil.
a = %w{ a b c d e f }
a1 = a.select { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]
puts a1
