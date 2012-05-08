class SessionsController < ApplicationController

  def new
    if signed_in?
      current_user_portal_path
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to action: 'new'
    else
      flash.now[:error] = "Mot de passe ou nom d'utilisateur incorrect"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
