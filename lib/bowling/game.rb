

module Bowling
  
  class Game
    
    def initialize()
      @throws = []
    end
    
    def score()
      return @throws.inject(0){ |sum, roll| sum + roll}
    end
    
    def roll( pins )
      @throws << pins
    end
    
    def frame( frame_number )
      return @throws.slice(0 .. 0 + 1).extend FrameScorer
    end

  end

  module FrameScorer
    def score()
      return self.inject(0, :+)
    end
  end
  
end

