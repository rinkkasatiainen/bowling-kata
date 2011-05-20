$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'

module Bowling
  describe Game do
    let(:game) { Game.new() }

    it "should calculate score after first frame" do
      game.roll(3)
      game.roll(6)
      game.score().should == 9
    end

    it "should calculate score of the first frame" do
      game.roll(3)
      game.roll(6)
      game.frame(1).score().should == 9      
    end

    it "should calculate score of the second frame" do
      4.times do
        game.roll(4)
      end
      game.frame(2).score().should == 16
      game.score().should == 16
    end
    
    context "with spares" do
      it "should calculate one throw after a spare" do
        game.roll 6
        game.roll 4
        game.roll 5
        game.frame(1).score().should == 15
      end

      it "should calculate spare to total score" do
        3.times do
          game.roll(5)
        end
        game.roll(0)
        game.score().should == 20
        game.frame(2).score.should == 20
      end
    end
    
    context "with strikes" do
      it "should be able to throw three times in 10th frame" do
        9.times do 
          game.roll(10)
        end
        game.frame(7).score.should == 210
        game.roll(10)
        game.frame(8).score.should == 240
        game.roll(10)
        game.frame(9).score.should == 270
        game.roll(10)
        game.frame(10).score.should == 300
        
      end
    end
  end
end