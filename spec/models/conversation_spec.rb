require 'rails_helper'

RSpec.describe Conversation, type: :model do


	context "is invalid" do
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

	context "relationships" do
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

end
