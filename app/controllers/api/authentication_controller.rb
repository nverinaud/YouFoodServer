class Api::AuthenticationController < ApplicationController
  def request_token
    puts params
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:pass])
      render json: {
          "youfood_remember_token" => user.remember_token
      }
    else
      render text: "Mot de passe ou nom d'utilisateur incorrect", status: 403
    end
  end
end
