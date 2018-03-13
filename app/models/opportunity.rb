class Opportunity < ApplicationRecord
	belongs_to :author, foreign_key: :author_id, class_name: "User"
	has_many :opportunity_skills, foreign_key: :skill_id
	accepts_nested_attributes_for :opportunity_skills

	validates_presence_of :description
end
