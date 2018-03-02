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
			@user = FactoryBot.build(:user, name: nil, email: nil, password: nil)
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

end
