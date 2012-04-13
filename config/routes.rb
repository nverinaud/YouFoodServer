YouFoodServer::Application.routes.draw do
  root to: 'sessions#new'
#  root to: 'api/documentation#index'

  resources :sessions, only: [:new, :create, :destroy]

  match '/director', to: 'portal#director'
<<<<<<< .merge_file_iUTJz1
  match '/signin', to: 'sessions#new'
=======
  match '/signin',  to: 'sessions#new'
>>>>>>> .merge_file_9K9pc1
  match '/signout', to: 'sessions#destroy', via: :delete

  namespace :api do
    match '/' => 'documentation#index'
  end

end
