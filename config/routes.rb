Rails.application.routes.draw do
  get 'sessions/new'
  root "sessions#new"
  get "/" => "tasks#index"
  resources :tasks 
  namespace :admin do
    resources :users
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
