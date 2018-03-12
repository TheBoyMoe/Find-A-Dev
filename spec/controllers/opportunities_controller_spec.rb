require 'rails_helper'

RSpec.describe OpportunitiesController, type: :controller do

	let!(:user){FactoryBot.create(:user)}

	describe "#index" do
		context "as a guest" do

			it "redirects the user to the login page" do
				get :index
				expect(response).to redirect_to new_user_session_path
			end
		end
	end


	describe "#new"


	describe "#create"


	describe "#show"


	describe "#edit"


	describe "#update"

end