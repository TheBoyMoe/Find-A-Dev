class Skill < ApplicationRecord

  def self.type
    %w[UserSkill ProjectSkill]
  end

  scope :user_skills, -> {where(type: 'UserSkill')}
  scope :project_skills, -> {where(type: 'ProjectSkill')}
end
