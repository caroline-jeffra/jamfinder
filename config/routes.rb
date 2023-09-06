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
  patch 'profiles/genre', to: 'profiles#update_genre', as: :update_genre
  patch 'profiles/instrument', to: 'profiles#update_instrument', as: :update_instrument
  patch 'profiles/cl_images', to: 'profiles#update_cl_images', as: :update_cl_images
end
