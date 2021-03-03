Rails.application.routes.draw do
 
  get 'group_messages/index'
  get 'rooms/index'
  get 'conversations/index'
  mount ActionCable.server => '/cable'
  get '/new_friends', to: 'homes#newFriends', as: 'new_friends'
  get '/invitations', to: 'homes#invitations', as: 'invitations'

 
  root 'homes#index'
  resources :send_invitations
  resources :messages
  resources :conversations
  resources :rooms
  resources :group_messages

  

  post '/add_friends/:id', to: 'send_invitations#accpeted',as: 'add_friends'
  get '/friends', to: 'homes#listFriends',as: 'list_friends'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
