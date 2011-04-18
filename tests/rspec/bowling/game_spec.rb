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
      pending
      (1..4).each do
        game.roll(4)
      end
      game.score().should == 16
      game.frame(2).score().should == 16
    end

  end

end