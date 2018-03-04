require 'rails_helper'
require 'capybara/rails'

RSpec.feature 'Feature test: create user profile', type: :feature do


	before {
		@user = FactoryBot.create(:user)
		@user.confirmed_at = Time.now.utc
		@user.save
		visit new_user_session_path
		fill_in 'user_email', with: "#{@user.email}"
		fill_in 'user_password', with: "#{@user.password}"
		click_button "Sign in"
	}

	it "directs user to their edit profile page" do
		expect(current_path).to eq "/users/#{@user.id}/edit"
	end

	it "displays the user 'Edit your profile' page" do
		expect(page).to have_content('Edit your profile')
	end


end