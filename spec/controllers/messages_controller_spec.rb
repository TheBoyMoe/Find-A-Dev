require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

	let!(:jack) {User.create(name: 'jack', email: 'jack@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
	let!(:jill) {User.create(name: 'jill', email: 'jill@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
	let!(:mary) {User.create(name: 'mary', email: 'mary@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
	let!(:conversation1) {jack.conversations.create(title: 'jack starts ...', recipient: jill)}
	let!(:conversation2) {jill.conversations.create(title: 'jill starts ...', recipient: mary)}

	before {
		conversation1.messages.create(content: 'Hi Jill,....', sender: jack)
		conversation1.messages.create(content: 'Hi Jack,....', sender: jill)
		conversation2.messages.create(content: 'Hi Mary, ....', sender: jack)
		conversation2.messages.create(content: 'Hello Jack, ....', sender: mary)
		sign_in jack

	}

	xdescribe "#index" do

		it "returns all the messages within that particular conversation" do
			get :index, params: {conversation_id: conversation1.id}
		end

		it "does not return messages a user may have in other conversations"

	end

	xdescribe "#create" do

		it "redirects the user to the conversation index view"

	end

	xdescribe "#new" do
		it "renders the new template" do
			get :new, params: {conversation_id: conversation1.id}
			expect(response).to render_template('new')
		end
	end

end