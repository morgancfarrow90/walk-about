Rails.application.routes.draw do


  root to: 'application#home'

  get '/comments/home', to: 'comments#home', as: 'comments_home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/:provider/callback' => 'sessions#google_signin'

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :edit, :show, :destroy]
  end

  resources :users do
    resources :activities, only: [:index, :new, :create]
  end

  resources :categories do
    resources :activities, only: [:index, :new, :create]
  end

  resources :activities do
    resources :comments, only: [:index, :new, :create, :show, :edit, :destroy]
  end

  resources :users do
    resources :comments, only: [:index]
  end

  resources :comments

end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
