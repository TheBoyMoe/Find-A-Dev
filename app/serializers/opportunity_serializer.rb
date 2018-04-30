class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :author 
  has_many :opportunity_skills
end
