YouFoodServer::Application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :orders, only: [:index]
  resources :menus
  resources :products
  resources :restaurants
  resources :zones
  resources :tables

  scope '/restaurant' do
    resources :employees
  end

  match '/director', to: 'portal#director'
  match '/restaurant_manager', to: 'portal#restaurant_manager'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/orders', to: 'orders#index'

  namespace :api do
    match '/' => 'documentation#index'
    match '/auth/request_token' => 'authentication#request_token', via: :post
    match '/call_waiter' => 'call_waiter#call_waiter', via: :post
    match '/current_menu' => 'menu#current_menu'
    match '/zones' => 'restaurants#zones'
    match '/tables' => 'restaurants#tables'
    match '/unauthorized' => 'authentication#unauthorized_access'
  end
end
