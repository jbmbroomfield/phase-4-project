Rails.application.routes.draw do
  root 'pages#index'
  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/auth/facebook' => 'sessions#facebook_create'
end
