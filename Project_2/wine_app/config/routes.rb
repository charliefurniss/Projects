Rails.application.routes.draw do
  
  resources :users

  resources :wines, only: [:index, :show]

  root 'users#index'

  
end
