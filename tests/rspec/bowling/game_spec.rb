$LOAD_PATH.unshift File.dirname(__FILE__)
require 'spec_helper'
require 'bowling'

module Bowling
  
  describe GameUi do
    let(:output) {double('output').as_null_object}

    it "should be able to start the application" do
      application = Bowling::GameUi.new(output)
      
      output.should_receive(:puts).with("Welcome to Bowling ScoreCard!")
      
      application.start()      
    end

    it "should be able to start a new game" do
      application = Bowling::GameUi.new(output)

      application.start()
      game = application.new_game()
      
      game.score.should eql 0
    end

    it "should show the empty score card"
  end
end