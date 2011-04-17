When /^I start the application$/ do
  @output_spy = Bowling::OutputSpy.new()
  @app = Bowling::GameUi.new(@output_spy)
  @app.start()
end

Then /^I the application opens with a welcome note "(.*)"$/ do | expected_note |
  @output_spy.messages.should include(expected_note)
end

Given /^I have the application running$/ do
  When("I start the application")
end