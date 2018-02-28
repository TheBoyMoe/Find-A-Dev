Then(/^I should receive a "([^"]*)" email$/) do |text|
	mails = ActionMailer::Base.deliveries
	expect(mails).not_to be_empty
	subjects = mails.map(&:subject)
	expect(subjects).to include text
end

Then(/^I click on the confirmation link in the email to "([^"]*)"$/) do |arg1|
	visit new_user_session_path
end

Then(/^I should not receive a confirmation email$/) do
	ActionMailer::Base.deliveries.size.should eq 0
end