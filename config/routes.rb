Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#show"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  post 'attend', to: 'events#attend'
end
