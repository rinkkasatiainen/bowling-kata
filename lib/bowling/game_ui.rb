
module Bowling
  
  class GameUi
    
    
    def initialize(output)
      @output = output
      @game = Bowling::Game.new()
    end
    
    def start()
      @output.puts 'Welcome to Bowling ScoreCard!'

      @output.puts score_card()
    end
    
    def new_game()
      @game
    end
    
    def score_card()
      score_card ="Score Card\n"
      score_card += print_frame_number(:frame_number)
      score_card += print_frame(:rolls)
      score_card += print_frame(:score)
      return score_card.chomp!
    end
    
    private
    def print_frame_number( item )
      score_card = ""
      (1..10).each do | frame_number |
        score_card += "|  #{@game.print_frame( frame_number )[item]} "
      end
      score_card += "|\n"
    end

    def print_frame( item )
      score_card = ""
      (1..10).each do | frame_number |
        score_card += "| #{@game.print_frame( frame_number )[item]} "
      end
      score_card += "|\n"
    end
    
  end
  
end