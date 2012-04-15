YouFoodServer::Application.routes.draw do
  root to: 'sessions#new'
#  root to: 'api/documentation#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :orders, only: [:index]

  match '/director', to: 'portal#director'
  match '/restaurant', to: 'portal#restaurant_manager'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/orders', to: 'orders#index'

  namespace :api do
    match '/' => 'documentation#index'
  end

end
