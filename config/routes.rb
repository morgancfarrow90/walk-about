Rails.application.routes.draw do

  root to: 'application#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :activities
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
