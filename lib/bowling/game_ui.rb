
module Bowling
  
  class GameUi
    
    def initialize(output)
      @output = output
    end
    
    def start()
      @output.puts 'Welcome to Bowling ScoreCard!'

      @output.puts score_card()
    end
    
    def new_game()
      return Bowling::Game.new()
    end
    
    private
    def score_card()
      score_card ="""Score Card
|  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 |  10 |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |
""".chomp!()
    end
    
  end
  
end