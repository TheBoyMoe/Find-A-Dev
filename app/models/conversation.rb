class Conversation < ApplicationRecord
	belongs_to :initiator, foreign_key: :initiator_id, class_name: 'User'
	belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
	has_many :messages, dependent: :destroy

	# validates_presence_of :title

	validates_uniqueness_of :initiator_id, scope: :recipient_id
	
	# ensure that only one conversation exists between the two users
	scope :between, -> (initiator_id, recipient_id) do
		where(initiator_id: initiator_id, recipient_id: recipient_id).or(
			where(initiator_id: recipient_id, recipient_id: initiator_id)																																		 
		)
	end
	
	# fetch the conversation or create it
	def self.fetch_conversation(initiator_id, recipient_id)
		conversation = between(initiator_id, recipient_id).first
		return conversation if conversation.present?

		create(initiator_id: initiator_id, recipient_id: recipient_id)
	end
	
end
