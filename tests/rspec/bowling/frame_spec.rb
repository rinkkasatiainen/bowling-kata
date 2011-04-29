$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'


module Bowling
  
  describe Frame do
  
    it "should know the rolls of the frame" do
      
      frame = Frame.new()
      frame.roll(2)
      frame.rolls.should == [2]
      frame.roll(8)
      frame.rolls.should == [2,8]
    end
    
    it "should know the score for the frame" do
      frame = Frame.new()
      frame.score.should == 0
      frame.roll(2)
      frame.roll(2)
      frame.score= 4
      frame.score.should == 4
    end
    
  end
end