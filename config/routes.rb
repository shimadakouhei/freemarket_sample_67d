Rails.application.routes.draw do
  root to: 'top#index'
  get 'products/purchase'
  post 'products', to: 'products#pay'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :top, only: [:index, :new, :create, :show]
  resources :users, only: [:show,:logout]
  resources :products do
  #   collection do
  #     get  'purchase/:id'=>  'items#purchase', as: 'purchase'
  #     post 'pay/:id'=>   'items#pay', as: 'pay'#httpメソッドはpostなので注意
  #     get  'done'=>      'items#done', as: 'done'
  end
  
  resources :cards, only: [:new, :show,:index ,:delete] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end


  
  
end