Rails.application.routes.draw do
  
  resources :user_wines , only: [:index, :show]

  resources :user_notes

  resources :sessions, only: [:new, :create]

  delete "/sessions" , to: "sessions#destroy"

  resources :notes, only: [:index, :show]

  resources :users , only: [:new , :index, :create]

  resources :wines

  root 'users#index'

  
end
