Rails.application.routes.draw do
  get 'sessions/new'
  root "tasks#index"
  get "/" => "tasks#index"
  resources :tasks 
  namespace :admin do
    resources :users
  end
  resources :sessions, only: [:new, :create, :destroy]
end
