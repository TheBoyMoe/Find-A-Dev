require 'rails_helper'

RSpec.describe User, type: :model do

	let!(:user) {FactoryBot.create(:user)}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:uid)}
	it {should respond_to(:provider)}
	it {should respond_to(:role)}
	it {should respond_to(:bio)}

	it "is valid with a name, email and password" do
		expect(user).to be_valid
	end

	it "returns the last_name" do
		expect(user.last_name).to eq 'User'
	end

	it "returns the first_name" do
		expect(user.first_name).to eq 'Mock'
	end

	it "is invalid if the email address has already been taken" do
		user2 = FactoryBot.build(:user, name: 'test@example.com', email: 'mock@example.com', password: '12345678')
		user2.valid?
		expect(user2).to_not be_valid
	end

	context "is invalid" do
		before {
			@user = FactoryBot.build(:user, name: nil, email: nil, password: nil, role: nil, bio: nil)
			@user.valid?
		}

		it 'without a name' do
			expect(@user.errors[:name]).to include("can't be blank")
		end

		it 'without an email address' do
			expect(@user.errors[:email]).to include("can't be blank")
		end

		it 'without a password' do
			expect(@user.errors[:password]).to include("can't be blank")
		end

		it 'without a role' do
			expect(@user.errors[:role]).to include("can't be blank")
		end

		it 'without a bio' do
			expect(@user.errors[:bio]).to include("can't be blank")
		end

	end

	context "implements a devise role that" do

		it "is by default 'user'" do
			expect(user.role).to eq 'user'
		end

		it "can be a 'developer'" do
			developer = FactoryBot.build(:user, role: 1)
			expect(developer.role).to eq 'developer'
		end

		it "can be a 'founder'" do
			founder = FactoryBot.build(:user, role: 2)
			expect(founder.role).to eq 'founder'
		end

	end

	context "relationship to Social Links and User Social Links" do

		let(:facebook_link){FactoryBot.create(:social_link)}
		let!(:user_social_link){FactoryBot.create(:user_social_link, user: user, social_link: facebook_link)}

		it "has many user social links" do
			expect(user.user_social_links).to include user_social_link
		end

		it "has many social links through user social links" do
			expect(user.social_links).to include facebook_link
		end

	end

	context "relationship to skills" do
		it "has many skills" do
			skill = FactoryBot.create(:skill, user: user)
			expect(user.skills).to include skill
		end
	end

	context "relationship to conversations" do

		let(:jack) {User.create!(name: 'jack', email: 'jack@ex.com', password: '12345678')}
		let(:jill) {User.create(name: 'jill', email: 'jill@ex.com', password: '12345678')}
		let(:conversation) {Conversation.create!(title: 'start a conversation', initiator: jack, recipient: jill)}
		let(:message) {Message.create(content: 'message body', sender: jack, conversation: conversation)}

		it "has many conversations" do
			expect(jack.conversations).to include conversation
		end

		it "does not include conversations not initiated" do
			expect(jill.conversations).to_not include conversation
		end

		it "has many messages" do
			expect(jack.messages).to include message
		end

		it "does not include messages where they are the recipient" do
			expect(jill.messages).to_not include message
		end
	end

end
