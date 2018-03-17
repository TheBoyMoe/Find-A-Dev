class Opportunity < ApplicationRecord
	belongs_to :author, foreign_key: :author_id, class_name: "User"
	has_many :opportunity_skills, foreign_key: :skill_id
	# accepts_nested_attributes_for :opportunity_skills

	validates_presence_of :title, :description

	def opportunity_skills_attributes=(skills_attributes)
		self.save
		skills_attributes.values.each do |skill_attribute|
			if skill_attribute[:title].present?
				self.opportunity_skills.create(skill_attribute)
			end
		end
	end
end
