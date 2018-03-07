require 'rails_helper'

Warden.test_mode!

RSpec.feature "User show page" do

	after(:each) {Warden.test_reset!}

	let(:developer) {FactoryBot.create(:user, email: 'developer@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:founder) {FactoryBot.create(:user, email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}

	# Scenario: User show page should display the users profile
	# 	Given I am signed in
	# 	When I visit the user show page
	# 	Then I should see details of the user's profile
	scenario "display the user's profile details" do
		developer.bio = "Over ten years of software development experience having worked in for many ......"
		developer.save
		FactoryBot.create(:skill, user: developer)
		social_link = FactoryBot.create(:social_link)
		FactoryBot.create(:user_social_link, user: developer, social_link: social_link)

		login_as(developer, scope: :user)
		visit user_path(developer)
		expect(page).to have_content(developer.name)
		expect(page).to have_content(developer.email)
		expect(page).to have_content(developer.bio)
		expect(page).to have_content(developer.skills.last.title)
		expect(page).to have_content(developer.skills.last.description)
		expect(page).to have_link("#{developer.social_links.last.name}", href: "#{developer.social_links.last.url}")
		expect(page).to have_link("Edit Profile")
	end

	scenario "a user can view other user's profile, but 'Edit Profile' btn not displayed" do
		login_as(founder, scope: :user)
		visit user_path(developer)

		expect(current_path).to eq "#{user_path(developer)}"
		expect(page).to_not have_link("Edit Profile")
	end
end