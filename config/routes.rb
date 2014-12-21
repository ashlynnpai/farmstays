Rails.application.routes.draw do

  root to: 'farms#index'
  
  resources :farms, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
  
  resources :users, only: [:create]
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :regions, only: [:show]
  
end
