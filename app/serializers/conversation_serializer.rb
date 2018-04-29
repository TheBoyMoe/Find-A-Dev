class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :initiator
  belongs_to :recipient
end
