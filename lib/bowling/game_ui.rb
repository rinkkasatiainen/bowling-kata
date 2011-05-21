
module Bowling
  
  class GameUi
    
    def initialize(output)
      @output = output
      @game = Bowling::Game.new()
    end

    def new_game()
      @game
    end
    
    def start()
      @output.puts 'Welcome to Bowling ScoreCard!'
      @output.puts score_card()
    end
    
    def input(pins)
      pins.scan(/\d+/) do | throws |
        @game.roll(throws.to_i)
      end
    end
    
    def score_card()
      score_card ="Score Card\n"
      score_card += print_frame(:frame_number)
      score_card += print_frame(:rolls)
      score_card += print_frame(:score)
      @output.puts score_card.chomp!
    end
    
    private
    def print_frame( item )
      score_card = ""
      (1...10).each do | frame_number |
        score_card << "| %-3s" % @game.print_frame( frame_number )[item]
      end
      score_card << "| %-4s" % @game.print_frame( 10 )[item]
      score_card += "|\n"
    end
    
  end
  
end