class Project < ApplicationRecord
	belongs_to :author, foreign_key: :author_id, class_name: "User"
	has_many :project_skills, foreign_key: :skill_id
	# accepts_nested_attributes_for :project_skills

	validates_presence_of :title, :description

	def project_skills_attributes=(skills_attributes)
		self.save
		skills_attributes.values.each do |skill_attribute|
			if skill_attribute[:title].present?
				self.project_skills.create(skill_attribute)
			end
		end
	end

end
