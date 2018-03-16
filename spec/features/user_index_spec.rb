require 'rails_helper'

Warden.test_mode!

RSpec.feature 'User index page', :devise do

	after(:each) {Warden.test_reset!}

	# Scenario: User index page should show a listing of registered developers
	# 	Given I am signed in
	# 	When I visit the user index page
	# 	Then I should only see a listing of developers
	scenario 'list registered developers' do
		developer1 = FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', confirmed_at: Time.now.utc)
		developer2 = FactoryBot.create(:user, name: 'Mock developer2', email: 'developer2@ex.com', role: 'developer', confirmed_at: Time.now.utc)
		founder = FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)

		login_as(developer1, scope: :user)
		visit users_path
		expect(page).to have_content developer1.name.upcase
		expect(page).to have_content developer2.name.upcase
		expect(page).to_not have_content founder.name
	end
end
