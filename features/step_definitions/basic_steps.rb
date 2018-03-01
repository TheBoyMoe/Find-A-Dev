Then /^I should( not)? see "([^"]*)"$/ do |negative, string|
	unless negative
		expect(page).to have_text string
	else
		expect(page).to_not have_text string
	end
end

When(/^I click the "([^"]*)" button$/) do |string|
	click_link_or_button(text)
end