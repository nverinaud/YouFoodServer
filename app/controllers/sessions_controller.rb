class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      if user.is_a? Director
        redirect_to '/director'
      end
    else
      flash.now[:error] = 'Couple identifiant/mot de passe invalide'
      render 'new'
    end
  end

  def destroy
  end

end
