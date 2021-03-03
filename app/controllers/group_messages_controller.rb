class GroupMessagesController < ApplicationController
  def index
  end

  def create
  	@room = Room.find(params[:room_id])
  	@group_message = @room.message_groups.new(params_group_mes)
  	if @group_message.save
  		 ActionCable.server.broadcast("#{@room.id}",
										   	message: @group_message.content,
										   	user: current_user.email,
									)
  	else
  		
  	end
  end
  private
  	def params_group_mes
  		params.require(:group_message).permit(:user_id,:content)
  	end
end
