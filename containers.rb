# Jun. 4, 2014 Fri.
# 4. Containers, Blocks, and Iterators, Programming Ruby 3rd Edition for ruby 1.9 and 2.0

# ---- Array (vs List in Python)
puts "--- Array (vs List in Python) ---"
a = [] # form 1
a[0] = 1
a[1] = "Two"
print a, "\n"

a2 = [ 3.14159,  "pie", 99 ] # form 2
puts a2.class # => Array
puts a2.length # => 3
puts a2[0] # => 3.14159
puts a2[1] # => "pie"
puts a2[2] # => 99
puts a2[3] # =>  nil

b = Array.new # form 3
puts b.class # => Array
puts b.length # => 0
puts b[0] = "second"
puts b[1] = "array"
puts b  # => ["second", "array"]

# Uses an iteration to output
puts "--- Uses an iteration to output the Array object ---"
a2.each {|e|
  puts e
}

# --- Hash (vs Dictionary in Python)
puts "\n--- Hash (vs Dictionary in Python) ---"
h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' } # form 1

puts h.length # => 3
puts h['dog'] # => "canine"
puts h['cow'] = 'bovine'
puts h[12]  = 'dodecine'
puts h['cat'] = 99

h2 = {} # form 2
h2["one"] = 1
puts h2["one"]

h3 = Hash.new # form 1
h3[100] = "one hundred"
puts h3[100]

# Uses an iteration to output
puts "--- Uses an iteration to output the Hash object---"
h3.each {|k, v|
  puts "#{k} => #{v}"
}
