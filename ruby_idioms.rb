# Created on Mar 5, 2019 Tue.
# Understanding Ruby's idiom: array.map(&:method) --
# https://www.brianstorti.com/understanding-ruby-idiom-map-with-symbol/

class Foo
  def method_name
    puts "method called for #{object_id}"
  end
end

# The plain version
[Foo.new, Foo.new].map do |element| 
  element.method_name
end

# The Ruby idiomatic version
[Foo.new, Foo.new].map(&:method_name)

# & -- Proc
puts "\n--- What Ruby does when it sees &"
class MyClass
  def to_proc
    puts "Trying to convert to a Proc ..."
    Proc.new {}
  end
end

[].map(&MyClass.new)

puts "\n--- Our own map method"
def my_map(enumerable, &block)
  result = []
  enumerable.each { |element| result << block.call(element) }
  result
end

puts my_map(["foo", "bar"], &:upcase)
# => ["FOO", "BAR"]


puts "--- Our own Symbol functionality"
class MySymbol
  def initialize(method_name)
    @method_name = method_name
  end

  def to_proc
    Proc.new do |element|
      element.send(@method_name)
    end
  end
end

puts my_map(["foo", "bar"], &MySymbol.new("upcase"))
# => ["FOO", "BAR"]

