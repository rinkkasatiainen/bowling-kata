Feature: Bowling game
   In order to track down the scores
   as a bowler
   I need to be able to input the score of each roll


   Scenario: Opening the application
     When I start the application
     Then I the application opens with a welcome note.

   Scenario: Starting a new game
     Given I have the application running
      When I start a new game
      Then I see the current score card:
        """
        Score Card
         | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8  | 9  |  10 |
         | -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |
         | -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |
        """
   
   Scenario: First roll
     Given I have created a new game
      When I roll '6'
      Then the score is updated to the score card

   Scenario: Rolling first frame
     Given I have created a new game
      When I roll '6 / 3'
      Then I the score of the first frame is 9
