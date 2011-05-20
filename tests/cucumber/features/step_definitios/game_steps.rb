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
  @game.roll(roll.to_i)
end

When /^I roll '(\d+) \/ (\d+)'$/ do |first, second|
  @game.roll(first.to_i)
  @game.roll(second.to_i)
end

When /^I roll (\d+) pins$/ do |roll|
  When("I roll '#{roll}'")
end

When /^I roll following pins:$/ do |roll_table|
  roll_table.hashes.each do |hash|
    @game.roll( hash['first'].to_i )
    @game.roll( hash['second'].to_i ) unless hash['second'] == '-'
  end
end

When /^I strike only strikes$/ do
  (1..12).each do 
    @game.roll(10)
  end
end

Then /^the score (\d+)st frame of the Score Card contains '(.*)'$/ do |frame_number, frame_content|
  rolls_for_frame(frame_number.to_i).strip.should == frame_content
end

Then /^I the score of the (\d+)st frame is (\d+)$/ do |frame_number, score|
  score_for_frame(frame_number.to_i).strip.should == score
end

Then /^the score should be (\d+)$/ do |expected_score|
  @game.score.should == expected_score.to_i
end

private
def rolls_for_frame(frame_number)
  parse_score_card(:rolls)[frame_number]  
end

def score_for_frame(frame_number)
  return parse_score_card(:score)[frame_number]  
end

def parse_score_card(type)

  score_card = {}
  score_card_as_string = @app.score_card().split("\n")
#  score_card_as_string = @output_spy.messages().detect{|str| str.include?('Score Card')}.split("\n")
  score_card[:score] = score_card_as_string[3]
  score_card[:rolls] = score_card_as_string[2]
  
  return score_card[type].extend ScoreCardParser
end

module ScoreCardParser
  
  def [](frame_number)
    self.split("|")[frame_number] 
  end
  
end

