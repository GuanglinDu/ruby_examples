# fiddling_with_symbols.rb
#
# Copyright 2009 Guanglin Du <dugl@petrochina.com.cn>
#   
# Shows how flexibly the symbols are used in Ruby. This is common in Rails.
# The Ruby_Newbie Guide to Symbols:
# http://www.troubleshooters.com/codecorn/ruby/symbols.htm

class FiddlingWithSymbols
	def initialize(arg1)
		@arg1 = arg1
	end
	
	def say_hi
	    printf "In method say_hi, @arg1 = %s\n", @arg1
	end
	
	# Emulates Rails add_column method
	def add_column(name, type, options = {})
	    printf "The column name is %s\n", name
	    printf "The type is %s\n", type
	    options.each {|key, value| puts "#{key} => #{value}" }
	end
end

fws = FiddlingWithSymbols.new(:test1) # a symbol as the argument
fws2 = FiddlingWithSymbols.new :test2 # another way to provide the argument
fws3 = FiddlingWithSymbols.new("test3") 
fws::say_hi # Use scope symbol to call the method
fws2.say_hi
fws3.say_hi
puts "-----------"

fws3.add_column :dgl, :decimal, precision: 8, scale: 2, default: 0
puts "-----------"
# same as above
fws3.add_column :qxq, :hexadecimal, 
                              {precision: 18, scale: 12, default: 10, label: "dyq"}
