Rails.application.routes.draw do
  root to: 'top#index'
  get 'cards/buy'
  # post "destroy", to: 'products#destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :top, only: [:index, :new, :create, :show]
  resources :users, only: [:show,:logout]
  resources :cards, only: [:index, :new, :show]
  resources :products do
  end
end