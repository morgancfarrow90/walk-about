Rails.application.routes.draw do

  root to: 'application#home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/:provider/callback' => 'sessions#google_signin'



  resources :activities

  resources :categories do
    resources :activities, only: [:index, :new, :create]
  end

  resources :users do
    resources :activities, only: [:index, :new, :create]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
