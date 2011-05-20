module Bowling
  
  class Game
    
    def initialize()
      @score_board = ScoreBoard.new()
    end
    
    def score()
      return @score_board.score()
    end
    
    def roll( pins )
      @score_board.roll( pins )
    end
    
    def frame( frame_number )
      @score_board.frame( frame_number )
    end

  end  
end

