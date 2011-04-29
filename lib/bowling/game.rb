module Bowling
  
  class Game
    
    def initialize()
      @score_board = ScoreBoard.new()
      # 
      # @throws = []
      # @current_frame = 1
    end
    
    def score()
      return @score_board.score()
       # return @throws.inject(0){ |sum, roll| sum + roll}
    end
    
    def roll( pins )
      @score_board.roll( pins )
      # @throws << pins
      # @current_frame += 1 if @throws.length % 2 == 0
    end
    
    def frame( frame_number )
      @score_board.frame( frame_number )
      # first_frame = ((frame_number) - 1) * 2
      # last_frame = first_frame + 1
      # last_frame += 1 if is_spare?(frame_number)
      # return @throws.slice(0 .. last_frame).extend FrameScorer
    end

    private
    def is_spare?( frame_number )
      first_frame = ((frame_number) - 1) * 2
      last_frame = first_frame + 1
      return (@throws.slice(first_frame .. last_frame).extend FrameScorer).score() == 10
    end
  end

  module FrameScorer
    def score()
      return self.inject(0, :+)  
    end
  end
  
end

