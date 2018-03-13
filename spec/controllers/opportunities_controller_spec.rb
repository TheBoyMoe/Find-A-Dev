require 'rails_helper'

RSpec.describe OpportunitiesController, type: :controller do

	let!(:user){FactoryBot.create(:user, confirmed_at: Time.now.utc)}
	let!(:opportunity) {FactoryBot.create(:opportunity, author_id: user.id)}

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


	describe "#show" do

		context "as an authenticated user" do
			it "renders the show view" do
				sign_in user
				get :show, params: {id: opportunity.id}
				expect(response).to render_template('show')
			end
		end

		context "as a guest user" do
			it "redirects the user to the login page" do
				get :show, params: {id: opportunity.id}
				expect(response).to redirect_to new_user_session_path
			end
		end
	end


	describe "#edit" do

		context "as an authenticated user" do
			it "renders the edit view" do
				sign_in user
				get :edit, params: {id: opportunity.id}
				expect(response).to render_template('edit')
			end
		end

		context "as an unauthorised user" do
			let!(:other_user) {FactoryBot.create(:user, name: 'Mock2', email:'Mock2@ex.com', confirmed_at: Time.now.utc)}

			it "redirects the user to the welcome page" do
				sign_in other_user
				get :edit, params: {id: opportunity.id}
				expect(response).to redirect_to welcome_path
			end
		end

		context "as a guest user" do
			it 'redirects the user to the login page' do
				get :edit, params: {id: opportunity.id}
				expect(response).to redirect_to new_user_session_path
			end
		end
	end


	describe "#update" do
		let!(:opportunity_params) {{	description: "We're looking to build the next best thing"}}

		context "as an authenticated user" do
			it "updates the opportunity" do
				sign_in user
				patch :update, params: {id: opportunity.id, opportunity: opportunity_params}
				expect(opportunity.reload.description).to eq opportunity_params[:description]
			end
		end

		context "as an unauthorised user" do
			let!(:other_user) {FactoryBot.create(:user, name: 'Mock2', email:'Mock2@ex.com', confirmed_at: Time.now.utc)}

			before {
				sign_in other_user
				patch :update, params: { id: opportunity.id, opportunity: opportunity_params}
			}

			it "does not update the opportunity" do
				expect(opportunity.reload.description).to eq "Looking to build the next Amazon!"
			end

			it "redirects the user to the welcome page" do
				expect(response).to redirect_to welcome_path
			end
		end

		context "as a guest user" do
			it "redirects the user to the login page" do
				patch :update, params: {id: opportunity.id, opportunity: opportunity_params}
				expect(response).to redirect_to new_user_session_path
			end
		end
	end

end