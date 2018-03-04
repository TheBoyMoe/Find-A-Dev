require 'rails_helper'
require 'capybara/rails'

RSpec.feature 'Feature test: create user profile', type: :feature do

	scenario 'newly created user is directed to complete their profile' do
		@user = FactoryBot.create(:user)
		@user.confirmed_at = Time.now.utc
		@user.save
		visit new_user_session_path
		fill_in 'user_email', with: "#{@user.email}"
		fill_in 'user_password', with: "#{@user.password}"
		click_button "Sign in"

		expect(current_path).to eq "/users/#{@user.id}/edit"
		expect(page).to have_content('Edit your profile')

		fill_in 'user_bio', with: "Ruby on Rails developer with over ten years of experience"
		select 'Developer', from: 'user_role'
		select 'Facebook', from: "user[social_links_attributes][0][name]"
		fill_in "user[social_links_attributes][0][url]", with: "https://facebook.com/mock"
		click_button "Update User"

		@user.reload
		expect(@user.bio).to eq "Ruby on Rails developer with over ten years of experience"
		expect(@user.role).to eq 'developer'
		# todo
		expect(@user.social_links.last)
	end

end