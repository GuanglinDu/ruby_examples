# Chapter 13 Unit Testing, Programming-Ruby-1.9&2.0 by Dave Thomas
# unittesting/bdd/1/ts_spec.rb
# ts = test suite

# How to run rspect tests: rspec tennis_scorer_spec.rb

require_relative "tennis_scorer"

describe "TennisScorer", "basic scoring" do
  def setup
    TennisScorer.new
  end
   
   it "should start with a score of 0-0" do
     ts = TennisScorer.new
    #ts.score.should == "0-0" # deprecated style
    expect(ts.score) == "0-0" # new style
  end
  
  it "should be 15-0 if the server wins a point" do
    ts = TennisScorer.new
    expect(ts.win) == "15-0"
  end
  
  it "should be 0-15 if the receiver wins a point"
  it "should be 15-15 after they both win a point"
  
  it "should be 0 if calling method sum with default args" do
    ts = setup
    expect(ts.sum) == 0
  end
end
