require 'rails_helper'

RSpec.describe Conversation, type: :model do


	describe "is invalid" do
		before {
			@conversation = FactoryBot.build(:conversation, initiator: nil, recipient: nil)
			@conversation.valid?
		}

		xit "without a title" do
			expect(@conversation.errors[:title]).to include "can't be blank"
		end

		it "without an initiator" do
			expect(@conversation.errors[:initiator]).to include "must exist"
		end

		it "without a recipient" do
			expect(@conversation.errors[:recipient]).to include "must exist"
		end

	end

	describe "relationships" do
		let(:jack) {User.create!(name: 'jack', email: 'jack@ex.com', password: '12345678')}
		let(:jill) {User.create(name: 'jill', email: 'jill@ex.com', password: '12345678')}
		let(:conversation) {jack.conversations.create(title: 'start a conversation', recipient: jill)}
		let(:message) {Message.create(content: 'message body', conversation: conversation, sender: jack)}

		it "belongs to the user initiating the conversation" do
			expect(conversation.initiator).to eq jack
		end

		it "belongs to the recipient of the conversation" do
			expect(conversation.recipient).to eq jill
		end


		it "has many messages" do
			expect(conversation.messages).to include message
		end
	end

	describe "class methods" do

		let!(:jack) {User.create(name: 'jack', email: 'jack@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
		let!(:jill) {User.create(name: 'jill', email: 'jill@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
		let!(:mary) {User.create(name: 'mary', email: 'mary@ex.com', password: '12345678', confirmed_at: Time.now.utc)}
		let!(:jack_initiates) {jack.conversations.create(title: 'jack starts ...', recipient: jill)}
		let!(:jill_initiates) {jill.conversations.create(title: 'jill starts ...', recipient: jack)}

		describe ".find_or_create" do

			it "creates a new conversation where none exists" do
				conversation = Conversation.find_or_create(mary.id, {title: 'New conversation', recipient_id: jill.id})
				expect([jack_initiates, jill_initiates]).to_not include conversation
			end

			it "returns an ongoing conversation" do
				conversation = Conversation.find_or_create(jack.id, {recipient_id: jill.id})
				expect([jack_initiates, jill_initiates]).to include conversation
			end

			it "returns nil when either user does not exist" do
				expect(Conversation.find_or_create(jack.id, {recipient_id: 10})).to be nil
			end

		end

		describe ".get_user_conversations" do
			let!(:mary_initiates) {mary.conversations.create(title: 'mary initiates ...', recipient: jill)}

			it "returns conversations where the user is either the initiator or the recipient" do
				conversations = Conversation.get_user_conversations(jack.id)
				array = conversations.map {|c| c.id}
				expect([jack_initiates.id, jill_initiates.id]).to eq array
			end
		end

	end


end
