# Mar. 22, 2014 Sat.
# How do I test my code with Minitest?
# http://rubylearning.com/blog/2011/07/28/how-do-i-test-my-code-with-minitest/

require 'minitest/autorun'
require_relative 'cash_registor'

# MiniTest::Unit::TestCase is now Minitest::Test
#class TestCashRegister < MiniTest::Unit::TestCase
class TestCashRegister < MiniTest::Test
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
  
	def test_i_lov_u
		assert @register.i_love_u, "i_love-u should return true"
	end

	def test_sum
		assert_equal 10, @register.sum(3, 7)
	end
end
