# https://www.railstutorial.org/book/rails_flavored_ruby
# Exercise 4.1
# Combine split, shuffle, and join to write a function that shuffles the letters in a given string

def string_shuffle(s)
  s.split('').shuffle.join
end

s1 = string_shuffle("foobar") # "oobfra"
puts s1

# Monkey patching (The class is open)
class String
  def shuffle
    self.split('').shuffle.join
  end
end

s2 = "foobar".shuffle # "borafo"
puts s2
