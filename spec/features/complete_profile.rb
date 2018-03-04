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

		select 'Developer', from: 'user_role'
		click_button "Update User"

		expect(@user.reload.role).to eq 'developer'
	end

end