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
		# let(:mock_user){FactoryBot.create(:user)}
		let!(:user_social_link){FactoryBot.create(:user_social_link, user: user, social_link: facebook_link)}

		it "has many social links" do
			expect(user.social_links.last).to eq facebook_link
		end

		it "has many user social links" do
			expect(user.user_social_links.last).to eq user_social_link
		end

	end

end
