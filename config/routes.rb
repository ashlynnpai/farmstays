Rails.application.routes.draw do

  root to: 'farms#index'
  
  resources :farms, only: [:index, :show] do
    collection do
      get :search, to: "farms#search"
    end
    resources :reviews, only: [:create]
  end
  
  resources :users, only: [:create, :show]
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/farms/search', to: 'farms#search'
  
  resources :regions, only: [:show]
  
end

