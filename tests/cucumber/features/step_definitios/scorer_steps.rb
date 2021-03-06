Then /^the score of the (\d+)(?:st|nd|rd|th) frame is (\d+)$/ do |frame_number, expected_score|
  @game.frame_score(frame_number.to_i).should == expected_score.to_i
end

Then /^the score is (\d+)$/ do |expected_score|
  @game.score().should == expected_score.to_i
end
