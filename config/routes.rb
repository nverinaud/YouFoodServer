YouFoodServer::Application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :menus
  resources :products
  resources :restaurants
  resources :zones
  resources :tables

  scope '/restaurant' do
    resources :employees
    resources :invoices, only: [:index]
    match '/invoices/:invoice_id/call-waiter/:table_id', to: "invoices#call_waiter"
  end

  match '/director', to: 'portal#director'
  match '/restaurant_manager', to: 'portal#restaurant_manager'
  match '/restaurant_manager/room', to: 'portal#room'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  namespace :api do
    resources :invoices, only: [:index, :show, :create, :update]

    match '/' => 'documentation#index'
    match '/auth/request_token' => 'authentication#request_token', via: :post
    match '/call_waiter' => 'call_waiter#call_waiter', via: :post
    match '/current_menu' => 'menu#current_menu'
    match '/zones' => 'restaurants#zones'
    match '/tables' => 'restaurants#tables'
    match '/unauthorized' => 'authentication#unauthorized_access'
  end
end
