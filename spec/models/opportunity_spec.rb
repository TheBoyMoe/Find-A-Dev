require 'rails_helper'

RSpec.describe Opportunity, type: :model do

	let!(:user) {FactoryBot.create(:user)}
	let!(:opportunity) {FactoryBot.create(:opportunity, author: user, description: 'Building the next Facebook')}

	it "is valid with a description and author" do
		expect(opportunity).to be_valid
	end

	context "is invalid" do
		let!(:invalid_opportunity) {FactoryBot.build(:opportunity, author: nil, description: nil)}

		before {
			invalid_opportunity.valid?
		}

		it "without an author" do
			expect(invalid_opportunity.errors[:author]).to include "must exist"
		end

		it "without a description" do
			expect(invalid_opportunity.errors[:description]).to include "can't be blank"
		end
	end

	context "relationship to opportunity skills" do
		let!(:opportunity_skill) {FactoryBot.create(:opportunity_skill, opportunity: opportunity)}

		it "has many opportunity skills" do
			expect(opportunity.opportunity_skills).to include opportunity_skill
		end
	end
end
