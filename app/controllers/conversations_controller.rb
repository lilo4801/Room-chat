class ConversationsController < ApplicationController

  def index
  	@conversation = Conversation.find(params[:conversation_id])

  	@message= NewMessage.new
  end

  def create

  	@a = Conversation.get(current_user.id,params[:user_id].to_i)

  	@new = @a.first if @a.present?
  	

    redirect_to root_path if current_user&.not_able_to_chat



  	redirect_to conversations_path(conversation_id: @new.id)
  end
end
