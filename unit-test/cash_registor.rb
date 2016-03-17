# Mar. 22, 2014 Sat.
# How do I test my code with Minitest? 
# http://rubylearning.com/blog/2011/07/28/how-do-i-test-my-code-with-minitest/

class CashRegister
  def initialize
     @items = []
   end
   
  def total
     @items.inject(0) {|sum, item| sum += item }
   end
   
   def scan(item)
     @items << item
     #@items.each { |i| puts i }
   end
   
	def i_love_u
		return true
	end

	def sum(x, y)
		return x + y
	end
end
