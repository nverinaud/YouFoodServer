YouFoodServer::Application.routes.draw do

  root to: 'api/documentation#index'

  namespace :api do
    match '/' => 'documentation#index'
  end

end
