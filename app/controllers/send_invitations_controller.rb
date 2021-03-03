class SendInvitationsController < ApplicationController
  def index
  end

  def create
  	@current_user = current_user

  	@new_user = User.find_by(id: params[:new_friend])
    if !Invitation.accpeted?(@current_user.id,@new_user.id)
     
        if @invitation = @current_user.send_invitations(@new_user)
        redirect_to root_path
      else
        render json: { errors: 'fails' }
      end
    else
      redirect_to invitations_path
    end
  
  end

  def accpeted
 	
 	check = Invitation.accpeted?(current_user.id,params[:id].to_i)
 
 	@invitation = Invitation.where(user_id: params[:id].to_i,friend_id: current_user.id)[0]
 		
 	@invitation.confirmed = check

 	if @invitation.save
 		redirect_to list_friends_path
 	else
 		render :root_path
 	end

  	
  end

end
