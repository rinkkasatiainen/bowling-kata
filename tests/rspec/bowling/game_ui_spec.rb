$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'

module Bowling
  
  describe GameUi do
    let(:output) { double('output').as_null_object }
    let(:application) { Bowling::GameUi.new(output) }

    it "should be able to start the application" do
      output.should_receive(:puts).with("Welcome to Bowling ScoreCard!")
      application.start()      
    end

    it "should be able to start a new game" do
      application.start()
      game = application.new_game()
      game.score.should eql 0
    end

    it "should show the empty score card" do      
      output.should_receive(:puts).with(
"""Score Card
| 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8  | 9  | 10  |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |"""
      )
      application.start()
    end

  end
end