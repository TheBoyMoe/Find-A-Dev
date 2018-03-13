require 'rails_helper'

Warden.test_mode!

RSpec.feature "create opportunity" do
	let!(:user) {FactoryBot.create(:user, confirmed_at: Time.now.utc)}

	after {Warden.test_reset!}

	scenario "a user can create an opportunity" do
		login_as user, scope: :user
		visit new_opportunity_path
		fill_in "opportunity_description", with: "Looking to build the next Amazon!"
		fill_in "opportunity_opportunity_skills_attributes_0_title", with: "Fullstack development"
		fill_in "opportunity_opportunity_skills_attributes_0_description", with: "Looking for that rockstar with....."
		# click_link "Add skill"
		# fill_in "opportunity_opportunity_skills_attributes_1_title", with: "Team Leader"
		# fill_in "opportunity_apportunity_skills_attributes_1_description", with: "Your a team leader, having..."
		click_on "Create Opportunity"

		expect(current_path).to eq opportunities_path
		expect(page).to have_content "Looking to build the next Amazon!"
		# expect(page).to have_content "Fullstack development"
		# expect(page).to have_content "Looking for that rockstar with....."
	end
end