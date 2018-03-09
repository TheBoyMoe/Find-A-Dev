require 'rails_helper'

Warden.test_mode!

RSpec.feature 'Navigation bar', :devise do

	let(:developer1) {FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:developer2) {FactoryBot.create(:user, name: 'Mock developer2', email: 'developer2@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:founder) {FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}

	after { Warden.test_reset!}

	scenario "clicking on 'Your profile' displays that user's profile and displays the 'Edit Profile' link" do
		login_as(developer1, scope: :user)
		visit root_path
		click_link 'Your profile'

		expect(current_path).to eq "#{user_path(developer1)}"
		expect(page).to have_link("Edit Profile", "#{edit_user_path(developer1)}")
	end

	scenario "clicking on 'Opportunities' reveals current opportunities"

end