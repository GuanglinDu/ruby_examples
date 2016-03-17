puts 'Ruby coding conventions'
puts 'See https://github.com/bbatsov/ruby-style-guide'

# good - method return
def multi_return
  [1, 2]
end

first, second = multi_return
puts "first = #{first}, second = #{second}"

# good - use with splat
first, *list = [1, 2, 3, 4]
puts "first = #{first}"
list.each { |e| puts e }

hello_array = *'Hello'
puts hello_array.length
hello_array.each { |e| puts e }

a = *(1..3)
puts a
