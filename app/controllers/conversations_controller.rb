class ConversationsController < ApplicationController

  def index
  	@conversation = Conversation.find(params[:conversation_id])

  	@message= NewMessage.new
  end

  def create

  	@a = Conversation.get(current_user.id,params[:user_id].to_i)
    redirect_to root_path if current_user&.not_able_to_chat
    @new = @a.first

  	redirect_to conversations_path(conversation_id: @new.id)
  end
end
