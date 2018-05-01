require 'rails_helper'

RSpec.describe ProjectSkill, type: :model do

	let!(:user) {FactoryBot.create(:user)}
	let!(:project) {FactoryBot.create(:project, author: user)}

	it "belongs to an project" do
		project_skill = project.project_skills.create(title: 'Rails', description: 'Over six years experience')
		expect(project_skill.project).to eq project
	end

end
