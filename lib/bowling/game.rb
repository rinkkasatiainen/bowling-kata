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
    
    #todo: can do differently? - needed only in cuke steps!!!
    def frame_score( frame_number )
      frame( frame_number ).score()
    end
    
    def print_frame( frame_number )
      number_of_throws_in_frame = frame_number == 10 ? 3 : 2
      frame = Hash.new()
      frame[:frame_number] = frame_number
      frame[:rolls] = print_frame_rolls( frame_number, number_of_throws_in_frame )
      frame[:score] = print_frame_score( frame_number, number_of_throws_in_frame )
      return frame
    end

    private

    def frame( frame_number )
      @score_board.frame( frame_number )
    end

    def print_tenth_frame( )
      frame = Hash.new()
      frame[:frame_number] = 10
      frame[:rolls] = print_frame_rolls( 10, 3 )
      frame[:score] = print_frame_score( 10, 3 )
      return frame
    end
    
    def print_frame_rolls( frame_number, number_of_throws_in_frame )
      rolls = translate_strikes_and_spares(@score_board.frame( frame_number ), number_of_throws_in_frame)
      rolls_as_plain_text(rolls)
    end
    
    def translate_strikes_and_spares(frame, number_of_throws_in_frame)
      rolls = ['-'] * number_of_throws_in_frame 
      frame.rolls().each_with_index do | roll, index |
        if roll == 10 && rolls[index - 1] == 0
          rolls[index] = '/'
        elsif roll == 10
          rolls[index] = 'X'      
        elsif index > 0 && roll + rolls[index - 1] == 10
          rolls[index] = '/'
        else
          rolls[index] = roll
        end
      end
      rolls
    end
    
    def rolls_as_plain_text(rolls)
      if rolls.join("") =~ /^\d{2}-$/ || rolls.join("") =~ /^X-$/
        return rolls.shift(rolls.length - 1).join("")
      else
        return rolls.join("")
      end
    end
    
    def print_frame_score( frame_number, number_of_throws )
      score = @score_board.frame( frame_number ).score().to_s()
      return score if @score_board.frame( frame_number ).can_calculate_score?()
      return "-" * number_of_throws
    end

  end  
end

