require_relative 'roman_number'
require 'minitest/autorun'

# These two lines cannot work!
#require 'test/unit'
#class TestRoman < Test::Unit::TestCase

class TestRoman < MiniTest::Unit::TestCase
  def test_simple
    assert_equal("i", Roman.new(1).to_s)
    assert_equal("ii", Roman.new(2).to_s)
    assert_equal("iii", Roman.new(3).to_s)
    assert_equal("iv", Roman.new(4).to_s)
    assert_equal("ix", Roman.new(9).to_s)
    assert_equal("xxi", Roman.new(21).to_s)
  end
end
