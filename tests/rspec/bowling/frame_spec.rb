$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'


module Bowling
  
  describe Frame do
  
    let (:frame) { Frame.new().extend NormalFrame }
    
    it "should know the rolls of the frame" do
      frame.roll(2)
      frame.rolls.should == [2]
      frame.roll(8)
      frame.rolls.should == [2,8]
    end
    
    it "should know the score for the frame" do
      frame.score.should == 0
      2.times { frame.roll(2) }
      frame.frame_score.should == 4
      frame.score= 4
      frame.score.should == 4
    end
    
    it "should be able to calculate score after two rolls" do
      frame.can_calculate_score?().should == false
      2.times { frame.roll(2) }
      frame.can_calculate_score?().should == true
    end

    context "with frames 1-9" do
      it "should know that  can roll when no rolls thrown" do
        frame.can_roll?.should == true
      end

      it "should know that frame can have two rolls" do
        frame.roll(5)
        frame.can_roll?.should == true
        frame.roll(5)
        frame.can_roll?.should == false
      end
    
      it "should know that strike is the only throw" do
        frame.roll(10)
        frame.can_roll?.should == false
      end
    end
    
    context "with 10th frame" do
      it "should know that frame can have two rolls if no spare/strike" do
        frame = Frame.new().extend LastFrame
        frame.roll(5)
        frame.can_roll?.should == true
        frame.roll(4)
        frame.can_roll?.should == false
      end
    
      it "should know that spare grants 3rd roll" do
        frame = Frame.new().extend LastFrame
        3.times do
          frame.can_roll?.should == true
          frame.roll(5)
        end
        frame.can_roll?.should == false
      end
    
      it "should know that can have 3 strikes" do
        frame = Frame.new().extend LastFrame
        3.times do
          frame.can_roll?.should == true
          frame.roll(10)
        end
        frame.can_roll?.should == false
        frame.frame_score.should == 30
      end
      
    end
    
    context "with Spares" do
            
      it "should know spare" do
        2.times { frame.roll(5) }
        frame.spare?().should == true
      end
            
      it "should be able to add a roll to 'sum of rolls' after a spare" do
        2.times { frame.roll(5) }
        frame.can_calculate_score?().should == false
        frame.subsequent_roll(5)
        frame.can_calculate_score?().should == true
      end
      
      it "should calculate frame score" do
        2.times { frame.roll(5) }
        frame.subsequent_roll(5)
        frame.frame_score.should == 15
      end
            
    end
    
    context "with Strikes" do
      
      it "should know strike" do
        frame.roll(10)
        frame.strike?().should == true
      end
      
      it "should be able to add two rolls to 'sum of rolls' after a strike" do
        frame.roll(10)
        2.times do
          frame.can_calculate_score?().should == false
          frame.subsequent_roll(5)
        end
        frame.can_calculate_score?().should == true
      end
      
      it "should calculate frame score" do
        frame.roll(10)
        frame.subsequent_roll(5)
        frame.subsequent_roll(0)
        frame.frame_score.should == 15
      end
      
    end
  end
end