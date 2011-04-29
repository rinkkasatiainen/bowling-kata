
module Bowling
  
  class ScoreBoard
    
    def initialize()
      @current_frame = 1
      @scored_frame = 0
      @frames = []
      10.times do
        @frames << Frame.new()
      end
    end
    
    def roll( pins )
      frame( @current_frame ).roll(pins)
      
      calculate_score()
      increment_frame_index_if_necessary()
    end 
    
    def score()
      frame(@scored_frame).score()
    end
    
    def frame( frame_index )
      return @frames[ frame_index - 1 ]
    end
    
    private
    def increment_frame_index_if_necessary()
      if frame_ready?( @current_frame ) 
        @current_frame += 1         
      end
    end
    
    def calculate_score()
      (@scored_frame ... @current_frame).each do
        if can_calculate_score?( @scored_frame + 1)
          calculate_frame_score()
        end
      end
    end
    
    def can_calculate_score?( frame_index )
      
      if strike?( frame( frame_index ) )
        if strike?( frame( frame_index + 1 ) )
          return frame( frame_index + 1 + 1 ).rolls.length == 1
        end
        return frame( frame_index + 1 ).rolls.length == 2
      
      elsif spare?( frame( frame_index ) ) 
        return frame( frame_index + 1 ).rolls.length == 1
      
      else
        return frame_index <= @current_frame && frame_ready?( @current_frame)        
      end
    end
    
    def strike?( frame )
      return frame.rolls[0] == 10
    end
    
    def spare?( frame )
      return frame.rolls().inject(:+) == 10
    end
    
    def frame_ready?( frame_number )
      return frame( @current_frame ).rolls().length == 2 || frame( @current_frame ).rolls[0] == 10
    end
    
    def calculate_frame_score() 
      _score = 0
      _score_of_previous_frame = frame(@scored_frame).score
      if strike?( frame( @scored_frame + 1 ) )
        if strike?( frame( @scored_frame + 1 + 1 ) ) 
          _score = _score_of_previous_frame + 10 + 10 + frame( @scored_frame + 1 + 1 + 1 ).rolls().inject(0,:+)
        else 
          _score = _score_of_previous_frame + 10 + frame( @scored_frame + 1 + 1).rolls().inject(0,:+)
        end
      elsif spare?( frame( @scored_frame + 1 ) )
        _score = _score_of_previous_frame + 10 + frame( @scored_frame + 1 + 1).rolls().inject(0,:+)
      else
        _score = _score_of_previous_frame + frame(@current_frame).rolls().inject(0,:+)
      end
      frame(@scored_frame + 1).score = _score
      @scored_frame += 1
    end
    
  end
  
end