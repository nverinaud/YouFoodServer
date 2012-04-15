YouFoodServer::Application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:index]

  match '/director', to: 'portal#director'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  namespace :api do
    match '/' => 'documentation#index'
  end

end
