# Created on Jul. 30, 2015 Thu.
# https://rubymonk.com/learning/books/1-ruby-primer/chapters/35-modules/lessons/80-modules-as-namespaces

# Modules can also hold classes. In this example, we'll try and define an Array class under our Perimeter
# module from the last lesson. Notice how it does not affect Ruby's Array class at all.
module Perimeter
  class Array
    attr_accessor :size
    
    def initialize
      @size = 400
    end
  end
end

our_array = Perimeter::Array.new
ruby_array = Array.new
p our_array.size

p our_array.class
p ruby_array.class


#wrap classes in appropriate namespaces using modules
module Gym
  class Push
    def up
      40
    end
  end
end
#require "gym"

module Dojo
  class Push
    def up
      30
    end
  end
end
# require "dojo"

dojo_push = Dojo::Push.new
p dojo_push.up

gym_push = Gym::Push.new
p gym_push.up


# Constant lookup (Note that both modules and classes are open in Ruby)
# We used the constant lookup (::) operator in the last section to scope our class to the module.
# As the name suggests, you can scope any constant using this operator and not just classes.
module Dojo
  A = 4
  module Kata
    B = 8
    module Roulette
      class ScopeIn
        def push
          15
        end
      end
    end
  end
end

A = 16
B = 23
C = 42

puts "A - #{A}"
puts "Dojo::A - #{Dojo::A}"

puts

puts "B - #{B}"
puts "Dojo::Kata::B - #{Dojo::Kata::B}"

puts

puts "C - #{C}"
puts "Dojo::Kata::Roulette::ScopeIn.new.push - #{Dojo::Kata::Roulette::ScopeIn.new.push}"


# You are given a library called RubyMonk. It contains a module Parser which defines a class CodeParser.
# Write another class TextParser in the same namespace that parses a string and returns an array of capitalized alphabets.
module RubyMonk
  module Parser
    class TextParser
      def self.parse
        # define method
      end
    end
  end
end


# If you prepend a constant with :: without a parent, the scoping happens on the topmost level.
# In this exercise, change push to return 16 as per A = 16 in the topmost level, outside the Kata module.
module Kata
  A = 5
  module Dojo
    B = 9
    A = 7
    
    class ScopeIn
      def push
        ::A
      end

      def push2
        A
      end
    end
  end
end

puts "A: #{A}"
puts "::A: #{::A}"
puts "Kata::A: #{Kata::A}"
puts "Kata::Dojo::A: #{Kata::Dojo::A}"
mysi = Kata::Dojo::ScopeIn.new
puts mysi.push
puts mysi.push2

# Using modules and namespacing is the standard way of organizing libraries with Ruby.
# It's a good practice to keep this in mind while writing one.