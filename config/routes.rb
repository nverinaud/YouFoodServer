YouFoodServer::Application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :orders, only: [:index]
  resources :products, only: [:index, :show, :new, :create]

  match '/director', to: 'portal#director'
  match '/restaurant', to: 'portal#restaurant_manager'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/orders', to: 'orders#index'

  namespace :api do
    match '/' => 'documentation#index'
    match '/auth/request_token' => 'authentication#request_token', via: :post
  end
  
end
