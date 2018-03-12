class AddTypeAndSkillToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :type, :string
    add_column :skills, :skill_id, :integer
  end
end
