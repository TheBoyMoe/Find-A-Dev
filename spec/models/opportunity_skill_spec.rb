require 'rails_helper'

RSpec.describe OpportunitySkill, type: :model do

	let!(:user) {FactoryBot.create(:user)}
	let!(:opportunity) {FactoryBot.create(:opportunity, author: user)}

	it "belongs to an opportunity" do
		opportunity_skill = opportunity.opportunity_skills.create(title: 'Rails', description: 'Over six years experience')
		expect(opportunity_skill.opportunity).to eq opportunity
	end

end
