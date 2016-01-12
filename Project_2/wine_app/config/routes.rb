Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create]

  delete "/sessions" , to: "sessions#destroy"

  resources :notes, only: [:index, :show]

  resources :users , only: [:new , :index, :create]

  resources :wines, only: [:index, :show]

  root 'users#index'

  
end
