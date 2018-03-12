class OpportunitySkill < Skill
	belongs_to :opportunity, foreign_key: :skill_id
end
