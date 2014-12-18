Rails.application.routes.draw do

  resources :farms, only: [:index, :show] do
    
  end
  
end
