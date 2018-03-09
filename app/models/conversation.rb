class Conversation < ApplicationRecord
	belongs_to :initiator, foreign_key: :initiator_id, class_name: 'User'
	belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
	has_many :messages, dependent: :destroy

	validates_presence_of :title
end
