require 'rails_helper'

RSpec.describe UserSkill, type: :model do

  let(:mock_user){FactoryBot.create(:user)}

  it "belongs to a user" do
    skill = mock_user.user_skills.create(title: 'Ruby on Rails', description: 'Over ten years of development experience')
    expect(skill.user).to eq mock_user
  end
end
