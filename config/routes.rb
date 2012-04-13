YouFoodServer::Application.routes.draw do
  root to: 'sessions#new'
#  root to: 'api/documentation#index'

  resources :sessions, only: [:new, :create, :destroy]

  match '/director', to: 'portal#director'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  namespace :api do
    match '/' => 'documentation#index'
  end

end
