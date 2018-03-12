class Skill < ApplicationRecord

  def self.type
    %w[UserSkill OpportunitySkill]
  end

  scope :user_skills, -> {where(type: 'UserSkill')}
  scope :opportunity_skills, -> {where(type: 'OpportunitySkill')}
end
