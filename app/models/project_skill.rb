class ProjectSkill < Skill
	belongs_to :project, foreign_key: :skill_id
end
