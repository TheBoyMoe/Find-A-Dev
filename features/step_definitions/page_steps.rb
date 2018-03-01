def paths(page)
	{
			'home'=> root_path,
			'sign in' => new_user_session_path,
			'sign up' => new_user_registration_path,
			'sign out' => destroy_user_session_path
	}[page]
end

Given(/^I am on the "([^"]*)" page$/) do |title|
	pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I (visit|should be on) the "([^"]*)" page$/) do |string, title|
	title.downcase!
	if string == 'visit'
		visit paths(title)
	elsif string == 'should be on'
		current_path.should eq paths(title)
	else
		raise "Unknown #{title} path"
	end
end

Then(/^I should be on the profile page for "([^"]*)"$/) do |email|
	user = User.find_by(email: email)
	expect(current_path).to eq user_path(user)
end
