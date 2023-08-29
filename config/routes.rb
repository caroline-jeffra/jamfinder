Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: %i[index show]
  resources :chatrooms, only: %i[index show], path: :chats, as: :chats do
    resource :messages, only: %i[create]
  end
  post :jams, to: 'jams#create'
  get '/dashboard', to: 'dashboards#show'
end
