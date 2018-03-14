require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	let(:developer) {FactoryBot.create(:user, name: 'Mock developer1', email: 'developer1@ex.com', role: 'developer', bio: "Ruby on Rails developer", confirmed_at: Time.now.utc)}
	let(:founder) {FactoryBot.create(:user, name: 'Mock founder', email: 'founder@ex.com', role: 'founder', confirmed_at: Time.now.utc)}

	describe "blocks a user from updating other user's profiles" do
		before {
			sign_in founder
			patch :update,  params: {id: developer.id, bio: "Sales and marketing expert with over 10 years experience"}
		}

		it "redirects the developers listing page" do
			expect(response).to redirect_to users_path
		end

		it "does not change developer bio" do
			expect(developer.reload.bio).to eq "Ruby on Rails developer"
		end
	end


	xdescribe "a user is prevented from updating their profile with invalid data" do

	end

end
