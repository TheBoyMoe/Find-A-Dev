require 'rails_helper'

RSpec.describe Message, type: :model do

  context "relationships" do
    let(:jack) {User.create!(name: 'jack', email: 'jack@ex.com', password: '12345678')}
    let(:jill) {User.create(name: 'jill', email: 'jill@ex.com', password: '12345678')}
    let(:conversation) {Conversation.create(title: 'start a conversation', initiator: jack, recipient: jill)}

    it "belongs to the conversation" do
      message = conversation.messages.create(content: 'message body', sender: jill)
			expect(conversation.initiator).to eq jack
    end

    it "belongs to the sender" do
      message = jack.messages.create(content: 'message body', conversation: conversation)
      expect(message.sender).to eq jack
    end

  end

end
