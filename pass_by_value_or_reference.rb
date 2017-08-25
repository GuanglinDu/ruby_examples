def add_entry(elements)
  a = [1, 2, 3, 4]
  a.each { |e| elements << e } 
end

def sum(a, b, c)
  c = a + b
  puts "c = #{c}"
  return c
end

elements = []
add_entry elements

elements.each { |e| puts e }

c = 0
d = sum 1, 2, c

puts c
