require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do

	let!(:jack) {User.create(name: 'jack', email: 'jack@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
	let!(:jill) {User.create(name: 'jill', email: 'jill@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
	let!(:conversation) {jack.conversations.create(title: 'jack starts ...', recipient: jill)}

	describe "#index" do

		before {
			sign_in jack
			get :index
		}

		it "responds successfully" do
			expect(response).to be_success
		end

	end

	describe "#create" do

		context "with valid users" do
			before {
				sign_in jack
				post :create, params: {id: jill.id}
			}

			it "display the current or new conversation when both users exist" do
				expect(response).to redirect_to conversation_messages_path(conversation)
			end
		end

		context "with an invalid recipient" do
			before {
				sign_in jack
				post :create, params: {id: 10}
			}

			it "redirect to the home page when either user does not exist" do
				expect(response).to redirect_to root_path
			end
		end


	end



end