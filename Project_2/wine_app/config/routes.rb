Rails.application.routes.draw do
  
  resources :users

  resources :wines

  root 'users#index'

  
end
