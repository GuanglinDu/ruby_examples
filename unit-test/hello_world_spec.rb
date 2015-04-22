# MiniTest Demos in Ruby (rspec-style).
# Created by DGL on Apr. 22, 2015 Wed.
# Install Ruby and then 'bundle install' to install gem minitest specified in Gemfile.
 
# MiniTest http://ruby-doc.org/stdlib-2.0/libdoc/minitest/rdoc/MiniTest.html
# Assertions: http://ruby-doc.org/stdlib-2.0/libdoc/minitest/rdoc/MiniTest/Assertions.html

require_relative 'hello_world'
require 'minitest/autorun'

###### Specs (rspec-style) ######
describe HelloWorld do
  before do
    @hw = HelloWorld.new
  end

  describe "when asked for the default value" do
    it "must respond positively" do
      @hw.say_something.must_equal "Unit Test"
    end
  end

  describe "when given name lijia" do
    it "won't say no" do
      @hw.say_something('lijia').must_equal "lijia"
    end
  end
end