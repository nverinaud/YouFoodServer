YouFoodServer::Application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :orders, only: [:index]
  resources :menus
  resources :products

  match '/director', to: 'portal#director'
  match '/restaurant', to: 'portal#restaurant_manager'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/orders', to: 'orders#index'

  namespace :api do
    match '/' => 'documentation#index'
    match '/auth/request_token' => 'authentication#request_token', via: :post
    match '/current_menu' => 'menu#current_menu'
    match '/unauthorized' => 'authentication#unauthorized_access'
  end
end
