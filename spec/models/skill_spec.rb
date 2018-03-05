require 'rails_helper'

RSpec.describe Skill, type: :model do

  let(:mock_user){FactoryBot.create(:user)}

	it "belongs to a user" do
		skill = mock_user.skills.create(name: 'Ruby on Rails', description: 'Over ten years of development experience')
		expect(skill.user).to eq mock_user
	end
end
