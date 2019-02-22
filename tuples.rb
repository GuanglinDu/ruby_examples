# Created on Jan. 21, 2019 Mon.
# See https://stackoverflow.com/questions/525957/using-tuples-in-ruby

require 'ostruct'

person = OpenStruct.new
person.name    = "John Smith"
person.age       = 70
person.pension = 300

puts person.name     # -> "John Smith"
puts person.age        # -> 70
puts person.address  # -> nil
