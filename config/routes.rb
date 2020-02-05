Rails.application.routes.draw do
  get 'cards/buy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'top#index'
  resources :top, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show]
end