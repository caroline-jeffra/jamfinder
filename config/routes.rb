Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :profiles, only: %i[index show]
  resources :chatrooms, only: %i[index show], path: :chats, as: :chats
  resources :messages, only: :create
  resources :jams, only: :create
  resources :genres, only: :create
  resources :instruments, only: :create

  get '/dashboard', to: 'pages#dashboard'

  patch 'profiles/bio', to: 'profiles#update_bio', as: :update_bio

end
