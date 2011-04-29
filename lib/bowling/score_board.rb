
module Bowling
  
  class ScoreBoard
    
    attr_reader :current_frame
    
    def initialize()
      @current_frame = 1
      @scored_frame_index = 0
      @frames = []
      10.times do
        @frames << Frame.new()
      end
    end
    
    def roll( pins )
      frame( current_frame() ).roll(pins)
      if can_calculate_score?( @scored_frame_index + 1)
        calculate_score()
      end
      if frame_ready?( current_frame() ) 
        @current_frame += 1         
      end
    end 
    
    def score()
      frame(@scored_frame_index).score()
    end
    
    private
    def can_calculate_score?( frame_index )
      if spare?( frame( frame_index ) ) 
        return frame( frame_index + 1 ).rolls.length > 0
      end
      return frame_index <= @current_frame && frame_ready?( @current_frame)
    end
    
    def spare?( frame )
      return frame.rolls().inject(:+) == 10
    end
    
    def frame_ready?( frame_number )
      return frame( current_frame() ).rolls().length == 2
    end
    
    public
    def frame( frame_index )
      return @frames[ frame_index - 1 ]
    end
    
    def calculate_score() 
      _score = 10
      _score_of_previous_frame = frame(@current_frame - 1).score
      if spare?( frame( @scored_frame_index + 1 ) )
        _score = _score_of_previous_frame + 10 + frame( @scored_frame_index + 1 + 1).rolls[0]
      else
        _score = _score_of_previous_frame + frame(@current_frame).rolls().inject(:+)
      end
      frame(@scored_frame_index + 1).score = _score
      @scored_frame_index += 1
    end
    
  end
  
end