Rails.application.routes.draw do
  root 'sections#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/auth/facebook' => 'sessions#facebook_create'

  resources :users, only: [:new, :create, :index, :show]

  resources :sections, only: [:new, :create, :show, :index] do
    resources :forum_threads, as: :threads, path: 'threads', only: [:new, :create, :show] do
      resources :posts, only: [:new, :create]
    end
  end

  get '/admins' => 'pages#admins'

end
