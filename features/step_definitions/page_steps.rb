def paths(page)
	{
			'home'=> root_path,
			'welcome' => welcome_path,
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

Then(/^I should be on the "([^"]*)" page for "([^"]*)"$/) do |title, email|
	user = User.find_by(email: email)
	if user.role == 'user'
		expect(current_path).to eq edit_user_path(user)
	else
		case title
			when 'edit'
				expect(current_path).to eq edit_user_path(user)
			when	'account'
				expect(current_path).to eq user_path(user)
			else
				root_path
		end
	end
end
