
module Bowling
  
  class Frame
    
    attr_reader :rolls
    attr_accessor :score
    
    def initialize()
      @score = 0
      @rolls = []
    end
    
    def roll(pins)
      @rolls << pins
    end
    
  end
  
end