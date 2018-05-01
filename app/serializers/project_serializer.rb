class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :author 
  has_many :project_skills
end
