class UserSkill < Skill
	belongs_to :user, foreign_key: :skill_id
end