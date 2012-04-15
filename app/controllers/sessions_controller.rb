class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to current_user_portal_path
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to current_user_portal_path
    else
      flash.now[:error] = 'Couple identifiant/mot de passe invalide'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
