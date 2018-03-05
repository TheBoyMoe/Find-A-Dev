require 'rails_helper'

RSpec.describe UserSocialLink, type: :model do

	let(:facebook_link){FactoryBot.create(:social_link)}
	let(:mock_user){FactoryBot.create(:user)}
	let!(:user_social_link){FactoryBot.create(:user_social_link, user: mock_user, social_link: facebook_link)}

	it "belongs to a user" do
		expect(user_social_link.user).to eq mock_user
	end

	it "belongs to a social link" do
    expect(user_social_link.social_link).to eq facebook_link
  end
end
