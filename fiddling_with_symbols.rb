# fiddling_with_symbols.rb
#       
# Copyright 2009 Guanglin Du <dugl@petrochina.com.cn>
#       
# Shows how flexibly the symbols are used in Ruby. This is common in Ruby on Rails.
# The Ruby_Newbie Guide to Symbols : http://www.troubleshooters.com/codecorn/ruby/symbols.htm

class FiddlingWithSymbols
	def initialize(arg1)
		@arg1 = arg1
	end
	
	def sayHi
	    printf "This is method sayHi: %s\n", @arg1
	end
	
	# Emulates Rails add_column method
	def add_column(name, type, options = {})
	    printf "Column name is: %s\n", name
	    printf "Type is: %s\n", type
	    options.each {|key, value| puts "The #{key} is #{value}" }
	end
end

fws = FiddlingWithSymbols.new(:test1) # a symbol as the argument
fws2 = FiddlingWithSymbols.new :test2 # another way to provide the argument
fws3 = FiddlingWithSymbols.new("test3") 
fws::sayHi # Use scope symbol to call the method
fws2.sayHi
fws3.sayHi
puts "-----------"

fws3.add_column :dgl, :decimal, precision: 8, scale: 2, default: 0
puts "-----------"
# same as above
fws3.add_column :qxq, :hexadecimal, 
                              {precision: 18, scale: 12, default: 10, label: "dyq"}
