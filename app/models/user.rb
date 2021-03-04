class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :new_messages
  has_many :conversations, foreign_key: :sender_id
  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation' , foreign_key: 'friend_id'
  has_many :message_groups

  def friends
  	friends_i_sent_invitaions = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
  	friends_i_got_invitaions = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
  	ids = friends_i_sent_invitaions + friends_i_got_invitaions
  	User.where(id: ids)
  end

  def friends_with(new_friend_id)
  	Invitation.confirm_invitaion(id,new_friend_id)
  end

  def send_invitations(user)
  	invitations.create(friend_id: user.id)
  end

  def not_able_to_chat
    false
  end
end
