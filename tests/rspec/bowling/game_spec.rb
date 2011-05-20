$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'

module Bowling
  describe Game do
    let(:game) { Game.new() }

    it "should print empty rolls for empty frame" do
      game.print_frame(1)[:rolls].should == "--"
      game.print_frame(1)[:score].should == "--"
      game.print_frame(1)[:frame_number].to_s.should == "1"
    end
    
    it "should print dash for empty rolls" do
      game.roll(3)
      game.print_frame(1)[:rolls].should == "3-"
      game.print_frame(1)[:score].should == "--"
    end

    it "should print frame rolls" do
      game.roll(3)
      game.roll(6)
      game.print_frame(1)[:rolls].should == "36"
    end

    it "should should print frame score" do
      game.roll(3)
      game.roll(6)
      game.print_frame(1)[:score].should == "9"      
    end

    context "with spares" do
      it "should mark spare as slash" do
        game.roll(4)
        game.roll(6)
        game.print_frame(1)[:rolls].should == "4/"
      end

      it "should calculate spare to total score" 
    end
    
    context "with strikes" do
      it "should mark strike as X" do
        game.roll(10)
        game.print_frame(1)[:rolls].should == "X"
      end
    end
    
    context "Tenth frame" do
      it "should mark three possible throws on the tenth frame" do
        game.print_frame(10)[:rolls].should == "---"
        game.print_frame(10)[:score].should == "---"        
      end
    end
  end
end