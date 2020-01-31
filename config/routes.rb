Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :top, only: [:index, :new, :create]
  resources :users, only: [:index, :show]
end