# Mar. 22, 2014 Sat.
# How do I test my code with Minitest? 
# http://rubylearning.com/blog/2011/07/28/how-do-i-test-my-code-with-minitest/

require 'minitest/autorun'

class TestCashRegister < MiniTest::Unit::TestCase
  def setup
    @register = CashRegister.new
  end

  def test_default_is_zero
    assert_equal 0, @register.total
  end
  
  def test_total_calculation
    @register.scan 1
    @register.scan 2
    assert_equal 3, @register.total
  end

end

##################
class CashRegister

  def initialize
     @items = []
   end
   
  def total
     @items.inject(0) {|sum, item| sum += item }
   end
   
   def scan(item)
     @items << item
     #@items.each {|i| puts i}
   end
end
