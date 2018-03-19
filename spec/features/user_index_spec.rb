require 'rails_helper'

Warden.test_mode!

RSpec.feature 'User index page', :devise do

	after(:each) {Warden.test_reset!}
	let!(:developer1) {FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let!(:developer2) {FactoryBot.create(:user, name: 'Mock developer2', email: 'developer2@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let!(:founder) {FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}

	# Scenario: User index page should show a listing of registered developers
	# 	Given I am signed in
	# 	When I visit the user index page
	# 	Then I should only see a listing of developers
	scenario 'list registered developers' do

		login_as(developer1, scope: :user)
		visit users_path
		expect(page).to have_content developer1.name.upcase
		expect(page).to have_content developer2.name.upcase
		expect(page).to_not have_content founder.name
	end

	scenario 'search for developers based on skill' do
		developer1.user_skills.create(title: 'Ruby on Rails', description: 'Ten years experience building apps based on the Rails framework...')
		developer2.user_skills.create(title: 'Java and Spring', description: 'Over a dozen years experience building apps with java and Java Spring...')
		founder.user_skills.create(title: 'Ruby on Rails', description: 'Over twelve years working in Fortune 500......')

		login_as(founder, scope: :user)
		visit users_path
		fill_in 'search', with: 'Rails'
		click_on 'Search'

		expect(page).to have_content(developer1.name.upcase)
		expect(page).to_not have_content(developer2.name.upcase)
		expect(page).to_not have_content(founder.name.upcase)
	end


end
