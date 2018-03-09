class ConversationsController < ApplicationController

	def index
		@conversations = Conversation.where(initiator_id: current_user.id).or(
				where(recipient_id: current_user.id))
	end

	def create
		@conversation = Conversation.find_or_create(current_user.id, params[:id])
		if @conversation
			redirect_to conversation_messages_path(@conversation)
		else
			render :index
		end
	end

end