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
    
    def print_frame( frame_number )
      case 
      when frame_number == 10
        print_tenth_frame()
      else
        print_normal_frame( frame_number )
      end
    end

    private
    def print_normal_frame( frame_number)
      frame = Hash.new()
      frame[:frame_number] = frame_number
      frame[:rolls] = print_frame_rolls( frame_number, 2 )
      frame[:score] = print_frame_score( frame_number, 2 )
      return frame
    end

    def print_tenth_frame( )
      frame = Hash.new()
      frame[:frame_number] = 10
      frame[:rolls] = print_frame_rolls( 10, 3)
      frame[:score] = print_frame_score( 10, 3 )
      return frame
    end
    
    def print_frame_rolls( frame_number, number_of_throws )
      frame = @score_board.frame( frame_number )
      rolls = frame.rolls()
      if rolls.length == 0
        return "-" * number_of_throws
      elsif rolls.length == 1
        return "X" if frame.strike?()
        return rolls.join("") + "-"
      else
        return rolls[0].to_s + "/" if frame.spare?()
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

