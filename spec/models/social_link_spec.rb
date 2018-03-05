require 'rails_helper'

RSpec.describe SocialLink, type: :model do

  let(:facebook_link){FactoryBot.create(:social_link)}
  let(:mock_user){FactoryBot.create(:user)}
  let!(:user_social_link){FactoryBot.create(:user_social_link, user: mock_user, social_link: facebook_link)}

	it "has many user social links" do
		expect(facebook_link.user_social_links).to include user_social_link
	end

	it "has many users through user social links" do
		expect(facebook_link.users).to include mock_user
	end

end
