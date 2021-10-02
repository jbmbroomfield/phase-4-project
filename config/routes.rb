Rails.application.routes.draw do
  root 'pages#index'

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/auth/facebook' => 'sessions#facebook_create'
end
