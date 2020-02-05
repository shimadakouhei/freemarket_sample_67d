Rails.application.routes.draw do
  get 'cards/buy'
  devise_for :users
  root 'top#index'
  resources :top, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show,:logout]
  resources :cards, only: [:index, :new]
end