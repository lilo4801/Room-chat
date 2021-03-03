class MessagesController < ApplicationController

	def new
		
	end
	def create
		@conversation = Conversation.find(params[:new_conversation_id])
		
		@message = @conversation.new_messages.create(params_mes)
		if @message.save
				@sender = @message.user
				@recipient = @message.conversation.opposed_user(@sender)
			
			   ActionCable.server.broadcast("conversations-#{@sender.id}",
										   	message: @message.body,
										   	user: "You",
										   	)
			   ActionCable.server.broadcast("conversations-#{@recipient.id}",
										   	message: @message.body,
										   	user: @sender.email,
										   	)

		else
			render json: {erros: 'fails'}
		end
	end
	private

		def params_mes
			  params.require(:message).permit(:user_id, :body)
		end
end
