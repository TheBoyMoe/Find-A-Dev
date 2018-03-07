require 'rails_helper'

Warden.test_mode!

RSpec.feature "Edit user profile page" do

	let(:developer1) {FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:developer2) {FactoryBot.create(:user, name: 'Mock developer2', email: 'developer2@ex.com', role: 'developer', confirmed_at: Time.now.utc)}
	let(:founder) {FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}



	scenario "users are blocked from editing other users profiles" do

	end
end