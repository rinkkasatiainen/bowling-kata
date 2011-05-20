
module Bowling
  
  class ScoreBoard
    
    def initialize()
      @frames = []
      9.times do
        @frames << ((Frame.new()).extend NormalFrame)
      end
      @current_frame = 1
      @scored_frame = 0
      frame = Frame.new()
      @frames << (frame.extend TenthFrame)
    end
        
    public
    
    def roll( pins )  
      (@scored_frame + 1 ... @current_frame).each do
        unless frame(@scored_frame + 1).can_calculate_score?()
          frame(@scored_frame + 1).subsequent_roll(pins)
          calculate_score()
        end
      end

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
      unless frame( @current_frame ).can_roll?
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
      return ( frame(frame_index).can_calculate_score?() )
    end
    
    def strike?( frame )
      return frame.rolls[0] == 10
    end
    
    def spare?( frame )
      return frame.rolls().inject(:+) == 10
    end
    
    def frame_ready?( frame_number )
      return !(frame( @current_frame ).can_roll?)
    end
    
    def calculate_frame_score() 
      score_of_previous_frame = frame(@scored_frame).score
      frame(@scored_frame + 1).score = score_of_previous_frame + frame(@scored_frame + 1).frame_score()
      @scored_frame += 1
    end
    
  end
    
end