Then /^I should( not)? see "([^"]*)"$/ do |negative, string|
	unless negative
		expect(page).to have_text string
	else
		expect(page).to_not have_text string
	end
end