require 'rails_helper'

RSpec.describe OpportunitiesController, type: :controller do

	let!(:user){User.create(name: 'Tom', email: 'tom@ex.com', password: 'password', confirmed_at: Time.now.utc)}

	describe "#index" do
		context "as a guest" do

			it "redirects the user to the login page" do
				get :index
				expect(response).to redirect_to new_user_session_path
			end
		end

		context "as an authenticated user" do
			before {
				sign_in user
				get :index
			}

			it "to be a success" do
				expect(response).to be_success
			end

			it "redirects the user to the opportunities listing" do
				expect(response).to render_template('index')
			end
		end
	end


	describe "#new" do

		context "as an authenticated user" do
			before {
				sign_in user
				get :new
			}
			it "renders the new template" do
				expect(response).to render_template('new')
			end
		end

		context "as a guest user" do
			it "redirects the user to the login page" do
				get :new
				expect(response).to redirect_to new_user_session_path
			end
		end
	end


	describe "#create" do

		context "as an authenticated user" do
			it "adds an opportunity when valid data is submitted" do
				sign_in user
				expect {
					post :create, params: {opportunity: {description: "New opportunity for a Rails dev.....", author_id: user.id}}
				}.to change(user.opportunities, :count).by(1)
			end

			it "does not add a new opportunity when invalid data is supplied" do
				sign_in user
				expect {
					post :create, params: {opportunity: {description: nil, author_id: user.id}}
				}.to_not change(user.opportunities, :count)
			end
		end

		context " as a guest user" do
			it "redirects the user to the login page" do
				get :create
				expect(response).to redirect_to new_user_session_path
			end
		end
	end


	describe "#show"


	describe "#edit"


	describe "#update"

end