require 'rails_helper'

Warden.test_mode!

RSpec.feature "Edit user profile page" do

	let(:developer) {FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:founder) {FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}

	after { Warden.test_reset!}

	scenario "users are blocked from editing other users profiles" do
		login_as(founder, scope: :user)
		visit edit_user_path(developer)
		expect(page).to have_content("Access denied")
		expect(current_path).to eq root_path
	end
end