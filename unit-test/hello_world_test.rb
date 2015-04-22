# MiniTest Demos in Ruby (traditional unit tests).
# Created by DGL on Apr. 22, 2015 Wed.
# Install Ruby and then 'bundle install' to install gem minitest specified in Gemfile.
 
# MiniTest http://ruby-doc.org/stdlib-2.0/libdoc/minitest/rdoc/MiniTest.html
# Assertions: http://ruby-doc.org/stdlib-2.0/libdoc/minitest/rdoc/MiniTest/Assertions.html

require_relative 'hello_world'
require 'minitest/autorun'

###### Unit Tests ######
class TestHelloWorld < MiniTest::Unit::TestCase
  def setup
    @hw = HelloWorld.new
  end
  
  # assert_equal
  def test_do_something
    # Tests the default value
	assert_equal("Unit Test", @hw.say_something, "Should be equal")
	# Tests a custom value
 	assert_equal("lijia", @hw.say_something("lijia"), "Should be equal")  
  end

  # assert
  def test_say_yes
    assert("yes" == @hw.say_yes, "Should be true")
  end
  
  # Other often used assertions
  # ASSERTION	EXPECTATION
  # assert_equal	must_equal
  # assert_instance_of	must_be_instance_of
  # assert_nil	must_be_nil
  # assert_raises	must_raise
end