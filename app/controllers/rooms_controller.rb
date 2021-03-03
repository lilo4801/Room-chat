class RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  end
  def show
  	@room = Room.find(params[:id])
    
    @users = @room.message_groups.map { |e| e.user.email }.uniq

  	
  end
  def create
  	@room = Room.new(params_room)
  	if @room.save
  		
  	else
  		
  	end
  end
  private
  def params_room
  	params.require(:room).permit(:name)
  end
end
