class MessagesController < ApplicationController
	before_action :set_conversation, only: [:index, :new, :create]

	def index
		@messages = @conversation.messages
		# @message = @conversation.messages.new
	end

	def create
		@message = @conversation.messages.build(message_params)
		if @message.save
			redirect_to conversation_messages_path(@conversation)
		end
	end

	def new
		@message = @conversation.messages.new
	end

	private
		def set_conversation
			@conversation = Conversation.find(params[:id])
		end

		def message_params
			params.require(:message).permit(:content, :sender_id)
		end
end