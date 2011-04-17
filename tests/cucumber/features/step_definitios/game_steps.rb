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

When /^I roll '(\d+)'$/ do |arg1|
  pending 
end

Then /^the score is updated to the score card$/ do
  pending 
end

When /^I roll '(\d+) \/ (\d+)'$/ do |first, second|
  pending 
end

Then /^I the score of the first frame is (\d+)$/ do |arg1|
  pending
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