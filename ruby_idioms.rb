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
class MyClass
  def to_proc
    puts "Trying to convert to a proc ..."
    Proc.new {}
  end
end

[].map(&MyClass.new)


def my_map(enumerable, &block)
  result = []
  enumerable.each { |element| result << block.call(element) }
  result
end

puts my_map(["foo", "bar"], &:upcase)
# => ["FOO", "BAR"]


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

