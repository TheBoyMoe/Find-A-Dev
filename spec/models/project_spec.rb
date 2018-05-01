require 'rails_helper'

RSpec.describe Project, type: :model do

	let!(:user) {FactoryBot.create(:user)}
	let!(:project) {FactoryBot.create(:project, author: user, description: 'Building the next Facebook')}

	it "is valid with a description and author" do
		expect(project).to be_valid
	end

	context "is invalid" do
		let!(:invalid_project) {FactoryBot.build(:project, author: nil, description: nil)}

		before {
			invalid_project.valid?
		}

		it "without an author" do
			expect(invalid_project.errors[:author]).to include "must exist"
		end

		it "without a description" do
			expect(invalid_project.errors[:description]).to include "can't be blank"
		end
	end

	context "relationship to project skills" do
		let!(:project_skill) {FactoryBot.create(:project_skill, project: project)}

		it "has many project skills" do
			expect(project.project_skills).to include project_skill
		end
	end
end
