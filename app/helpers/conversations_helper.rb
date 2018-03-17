module ConversationsHelper

	def conversation_details(conversation)
		initiator = conversation_author(conversation)
		recipient = conversation_recipient(conversation)
		if recipient.empty?
			"#{initiator}"
		else
			"#{initiator}, recipient #{recipient}"
		end

	end


	private
		def conversation_author(conversation)
			initiator = conversation.initiator
			str = (current_user == initiator)? "You" : initiator.name
		end

		def conversation_recipient(conversation)
			recipient = conversation.recipient
			str = (current_user == recipient)? "" : recipient.name
		end

end