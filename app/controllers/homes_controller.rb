class HomesController < ApplicationController
	before_action :check_logged_in ,only: [:invitations,:listFriends,:newFriends]
  def index
  	
  end
  def invitations
    @invitations = current_user.pending_invitations
    render :invitations
  end
  def listFriends
    @listFriends = current_user.friends
    render :listfriends
  end
  def newFriends
  	@users = User.where(" id != #{current_user.id}")
  	render :newfriend
  end

  private

  	def check_logged_in
  		unless user_signed_in?
  			redirect_to root_path
  		end
  	end

end
