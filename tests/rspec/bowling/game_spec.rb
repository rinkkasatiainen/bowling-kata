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
      (1..4).each do
        game.roll(4)
      end
      game.score().should == 16
      game.frame(2).score().should == 16
    end
    
    it "should calculate one throw after a spare" do
      game.roll 6
      game.roll 4
      game.roll 5
      game.frame(1).score().should == 15
    end

    it "should calculate spare to total score" do
      (1..3).each do
        game.roll(5)
      end
      game.roll(0)
      game.score().should == 20
      game.frame(2).score.should == 20
    end

  end

end