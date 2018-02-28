Given(/^the following user is registered:$/) do |table|
	# table is a Cucumber::MultilineArgument::DataTable
	table.hashes.each do |attributes|
		FactoryBot.create(:user, attributes)
	end
end

Given(/^I sign up as "([^"]*)" with email "([^"]*)" and password "([^"]*)" and password confirmation "([^"]*)"$/) do |name, email, password, password_confirmation|
	sign_up_with_valid_data(name, email, password, password_confirmation)
end

Then(/^I sign in as "([^"]*)" with password "([^"]*)" and password confirmation "([^"]*)"$/) do |email, password, password_confirmation|
	sign_in_with_valid_data(email, password, password_confirmation)
end

When(/^I sign up with out a name$/) do
	create_visitor
	@visitor = @visitor.merge(name: '')
	sign_up
end

When(/^I sign up with an invalid email$/) do
	create_visitor
	@visitor = @visitor.merge(email: 'invalid_email')
	sign_up
end

When(/^I sign up without a password$/) do
	create_visitor
	@visitor = @visitor.merge(password: '')
	sign_up
end

When(/^I sign up without a password confirmation$/) do
	create_visitor
	@visitor = @visitor.merge(password_confirmation: '')
	sign_up
end

When(/^I sign up with a password that is less than (\d+) characters$/) do |arg1|
	create_visitor
	@visitor = @visitor.merge(password: '123456', password_confirmation: '123456')
	sign_up
end

When(/^I sign up with a mismatched passwords$/) do
	create_visitor
	@visitor = @visitor.merge(password_confirmation: '12345678')
	sign_up
end

When(/^I sign up with out an email$/) do
	create_visitor
	@visitor = @visitor.merge(email: '')
	sign_up
end

When /^I sign out$/ do
	page.driver.submit :delete, destroy_user_session_path, {}
end

Then /^I should see a successful sign in message$/ do
	expect(page).to have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
	expect(page).to have_content "Welcome! You have signed up successfully."
end

Then /^I should see a successful sign out message$/ do
	expect(page).to have_content "Signed out successfully."
end

Then(/^I should see a missing name message$/) do
	expect(page).to have_content "Name can't be blank"
end

Then(/^I should see an missing email message$/) do
	expect(page).to have_content "Email can't be blank"
end

Then(/^I should see an invalid email message$/) do
	expect(page).to have_content "Invalid Email or password."
end

Then(/^I should see a missing password message$/) do
	expect(page).to have_content "Password can't be blank"
end

Then(/^I should see a missing password confirmation message$/) do
	expect(page).to have_content "Password confirmation doesn't match Password"
end

Then(/^I should see a password too short message$/) do
	expect(page).to have_content "Password is too short (minimum is 6 characters)"
end

Then(/^I should see an invalid password message$/) do
	expect(page).to have_content "Invalid Email or password."
end

Then(/^I should see a mismatched password message$/) do
	expect(page).to have_content "Password confirmation doesn't match Password"
end

Then(/^I should see email taken message$/) do
	expect(page).to have_content "Email has already been taken"
end
