
module Bowling
  
  class ScoreBoard
    
    def initialize()
      @frames = []
      9.times do
        @frames << ((Frame.new()).extend NormalFrame)
      end
      @frames << ((Frame.new()).extend LastFrame)
      @current_frame = 1
      @scored_frame = 0
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
        if frame(@scored_frame + 1).can_calculate_score?()
          calculate_frame_score()
        end
      end
    end
    
    def calculate_frame_score() 
      score_of_previous_frame = frame(@scored_frame).score
      frame(@scored_frame + 1).score = score_of_previous_frame + frame(@scored_frame + 1).frame_score()
      @scored_frame += 1
    end
  end
end