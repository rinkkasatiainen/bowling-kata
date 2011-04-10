Feature: Bowling
	In order to know scores
	a bowler needs to see score automatically by the system
	to decrease the learning curve of bowling and especially scoring
	
	Background: 
	  Given I have started a new game
	
	Scenario: Starting a game
	   Then the score should be 0
	
	Scenario: Calculating a score for the first frame
	   When I roll 6 pins
	    And I roll 3 pins
	   Then the score should be 9
	
	Scenario: Tracking scores of individual frames
	   When I roll following pins:
	      | first | second |
	      | 3 | 6 |
	      | 4 | 1 |
	   Then the score should be 14
	    And the score of the 1st frame is 9
	    And the score of the 2nd frame is 14
	
	Scenario: Calculating scores when rolling a spare
	   When I roll following pins:
	      | first | second |
	      | 4 | 6 |
	      | 9 | 0 |
	   Then the score of the 1st frame is 19
	    And the score is 28
	
	Scenario: Calculating scores when rolling a strike
	   When I roll following pins:
	      | first | second |
	      | 10 | - |
	      | 10 | - |
	      | 9 | 0 |
	   Then the score of the 1st frame is 29
	    And the score of the 2nd frame is 49
	
	Scenario: All strikes
	   When I strike only strikes
	   Then the score should be 300