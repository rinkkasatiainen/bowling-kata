
module Bowling
  
  class Frame
    
    attr_reader :rolls
    attr_accessor :score
    
    def initialize()
      @score = 0
      @rolls = []
      @subsequent_rolls = []
    end
    
    def roll(pins)
      @rolls << pins
    end
    
    def subsequent_roll(pins)
      @subsequent_rolls << pins 
    end
    
    def frame_score()
      return @rolls.inject(0, :+) + @subsequent_rolls.inject(0, :+)
    end

    def spare?()
      return @rolls.length == 2 && @rolls.inject(0, :+) == 10
    end    
    
    def strike?()
      return @rolls[0] == 10
    end
        
  end
  
  module NormalFrame
    
    def can_roll?()
      rolls.length < 2 && rolls.inject(0, :+) != 10
    end
    
    def can_calculate_score?()
      if spare?()
        return @subsequent_rolls.length == 1
      elsif strike?()
        return @subsequent_rolls.length == 2
      end
      return @rolls.length == 2 
    end

  end
  
  module TenthFrame
    
    def can_calculate_score?()
      if @rolls.length == 3
        return true
      elsif @rolls.length == 2
        return frame_score < 10
      end
      return false
    end
    
    def can_roll?()
      rolls.length < 2                   ||
      spare?() && rolls.length < 3       ||
      rolls[0] == 10 && rolls.length < 3
    end
    
    def spare?()
      return @rolls.length == 2 && @rolls.inject(0, :+) == 10
    end    
    
  end
end