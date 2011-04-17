When /^I start a new game$/ do
  Given("I start the application")
  @game = @app.new_game()
end

Then /^I see the current score card:$/ do | expected_string |
  @output_spy.messages.should include( expected_string )
end

Given /^I have created a new game$/ do
  When("I start a new game")
end

Given /^I have started a new game$/ do
  Given( "I have created a new game" )
end

When /^I roll '(\d+)'$/ do |roll|
  pending
  @game.roll(roll)
end

Then /^the score (\d+)st frame of the Score Card contains '(.*)'$/ do |frame_number, frame_content|
  rolls_for_frame(frame_number.to_i).should include frame_content
end

def rolls_for_frame(frame_number)
  score_card = @output_spy.messages().detect{|str| str.include?('Score Card')}.split("\n")
  score_card_score_row = score_card[3]
  score_card_rolls = score_card[2]
  score_card_frame_numbers = score_card[1]
  return score_card_rolls.split("|")[frame_number]  
end

When /^I roll '(\d+) \/ (\d+)'$/ do |first, second|
  pending
  @game.roll(first)
  @game.roll(second)
end

Then /^I the score of the (\d+)st frame is (\d+)$/ do |frame_number, score|
  score_for_frame(frame_number.to_i).should == score.to_s
end

def score_for_frame(frame_number)
  score_card = @output_spy.messages().detect{|str| str.include?('Score Card')}.split("\n")
  score_card_score_row = score_card[3]
  score_card_rolls = score_card[2]
  score_card_frame_numbers = score_card[1]
  return score_card_rolls.split("|")[frame_number]  
end

Then /^the score should be (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I roll (\d+) pins$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I roll following pins:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I strike only strikes$/ do
  pending # express the regexp above with the code you wish you had
end