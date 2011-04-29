$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'

module Bowling
  describe ScoreBoard do

    let( :score_board ) { ScoreBoard.new() }
    
    it "should start from frame number 1" do
      score_board.current_frame().should == 1    
    end

    it "should calculate score for first frame" do
      score_board.roll(3)
      score_board.roll(6)
      score_board.frame(1).score().should == 9
    end

    it "should know that frame number 2 is after two throws on first frame" do
      2.times{ score_board.roll(4) }
      score_board.current_frame().should == 2
    end
    
    it "should calculate score of second frame as sum of previous frame and current frame" do  
      4.times{ score_board.roll(4) }
      score_board.frame(2).score().should == 16
    end

    it "should calculate total score" do
      4.times{ score_board.roll(1) }
      score_board.score().should == 4 
    end

    it "should calculate a spare score after the next throw" do
      2.times{ score_board.roll(5) }
      score_board.frame(1).score().should == 0
      score_board.roll(10)
      score_board.frame(1).score().should == 20
      score_board.score().should == 20
    end

  end
end