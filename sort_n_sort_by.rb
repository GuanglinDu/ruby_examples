# Created on Wed Jun 13, 2019.
# Ruby's Sort and Sort_by
# https://mixandgo.com/learn/ruby-sort-and-sort-by

# How to Sort a Hash in Ruby
puts "-- Sort a hash"
my_hash = {
  name: "John",
  age: 21,
  address: "Main Str. 11",
  email: "john@example.com"
}

data = my_hash.sort_by { |k, v| k } # array
puts "The data type is #{data.class}"
data.each {|element|
  puts element
}
# => [
#  [:address, "Main Str. 11"],
#  [:age, 21],
#  [:email, "john@example.com"],
#  [:name, "John"]
#]

# How to sort an array of hashes in ruby
puts "-- Sort an array of hashes"
scores = [
  {name: "Superman", score: 745},
  {name: "Ironman", score: 9},
  {name: "Batman", score: 10}
]

scores = scores.sort_by { |h| h[:name] }
puts scores
# => [
#  {:name=>"Batman", :score=>10},
#  {:name=>"Ironman", :score=>9},
#  {:name=>"Superman", :score=>745}
#]
