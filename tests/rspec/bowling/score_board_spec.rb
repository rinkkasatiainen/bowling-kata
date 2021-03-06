$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'

module CurrentFrame
  def current_frame()
    @current_frame
  end
end

module Bowling
  describe ScoreBoard do

    let( :score_board ) { ScoreBoard.new() }
    
    context "with no spares / strikes" do
      it "should start from frame number 1" do
        score_board.extend CurrentFrame
        score_board.current_frame().should == 1    
      end

      it "should calculate score for first frame" do
        score_board.roll(3)
        score_board.roll(6)
        score_board.frame(1).score().should == 9
      end

      it "should know that frame number 2 is after two throws on first frame" do
        score_board.extend CurrentFrame
        2.times{ score_board.roll(4) }
        score_board.current_frame().should == 2
      end
    
      it "should calculate score of second frame as sum of previous frame and current frame" do
        4.times{ score_board.roll(4) }
        score_board.frame(2).score().should == 16
      end

      it "should calculate total score" do
        10.times do 
          2.times { score_board.roll(1) }
        end
        score_board.score().should == 20 
      end
    end
    
    context "with spares" do
      it "should calculate a spare score after the next throw" do
        2.times{ score_board.roll(5) }
        score_board.frame(1).score().should == 0
        score_board.roll(10)
        score_board.frame(1).score().should == 20
        score_board.score().should == 20
      end
    end
    
    context "with strikes" do
      it "strike is only throw on frames from 1 to 9" do
        score_board.extend CurrentFrame
        score_board.roll(10)
        score_board.current_frame().should == 2
      end
    
      it "should be able to throw three strikes on 10th frame" do
        score_board.extend CurrentFrame
        9.times do
          score_board.roll(10)
        end
        3.times do
          score_board.current_frame().should == 10
          score_board.roll(10)
        end
      end
    
      it "should calculate score for strike only after two rolls after the strike" do
        score_board.roll(10)
        score_board.frame(1).score().should == 0
        score_board.roll(1)
        score_board.frame(1).score().should == 0
        score_board.roll(1)
        score_board.frame(1).score().should == 12
      end

      it "should calculate three consecutive strikes" do
        3.times{ score_board.roll(10) }
        score_board.frame(1).score().should == 30 
        score_board.score().should == 30
      end
      
      it "should calculate maximum score" do
        12.times { score_board.roll(10) }
        score_board.score().should == 300
      end
    end

    it "should calculate strikes, spares and misses" do
      2.times{ score_board.roll(10) }
      # 3rd frame
      score_board.roll(9)
      score_board.score().should == 29
      score_board.roll(1)
      score_board.score().should == 49
      # 4th frame
      score_board.roll(1)
      score_board.score().should == 60
      score_board.roll(8)
      score_board.score().should == 69
    end

  end
end