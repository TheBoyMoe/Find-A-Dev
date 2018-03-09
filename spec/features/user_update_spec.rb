require 'rails_helper'

Warden.test_mode!

RSpec.feature "user update action" do

	let(:developer) {FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:founder) {FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}

	before {
		# populate test database with social links
		social_links = %w[Facebook Twitter Github Google-Plus Linkedin]
		i = 0
		5.times do
			SocialLink.create!(
					name: social_links[i]
			)
			i += 1
		end
	}

	after{Warden.test_reset!}

	scenario "a user can update their own profile" do
		login_as(founder, scope: :user)
		visit edit_user_path(founder)

		fill_in 'user_bio', with: 'Sales and marketing expert with over 10 years experience'
		fill_in 'user_skills_attributes_0_title', with: 'Software sales'
		fill_in 'user_skills_attributes_0_description', with: "Over 10 years of software sales with fortune 500 companies"
		select 'Linkedin', from: 'user_social_links_attributes_0_name'
		fill_in 'user_social_links_attributes_0_url', with: "https://linkedin.com/#{developer.first_name}"
		click_on "Update User"

		expect(current_path).to eq user_path(founder)
		expect(page).to have_content("Sales and marketing expert with over 10 years experience")
		expect(page).to have_content("Software sales")
		expect(page).to have_content("Over 10 years of software sales with fortune 500 companies")
		# expect(page).to have_link("Linkedin", "https://linkedin.com/#{developer.first_name}")
		expect(page).to have_css(".fa-linkedin")
	end

end