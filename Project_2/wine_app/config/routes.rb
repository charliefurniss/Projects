Rails.application.routes.draw do
  
  resources :user_wines , only: [:index, :show]

  resources :user_notes , only: [:index, :show]

  resources :sessions, only: [:new, :create]

  delete "/sessions" , to: "sessions#destroy"

  resources :notes

  resources :users , only: [:new , :index, :create]

  resources :wines

  delete "/wines/:id" , to: "wines#destroy"

  post "/notes/:id/wine_note_new", to: "notes#wine_note_new"

  root 'users#index'

  
end
