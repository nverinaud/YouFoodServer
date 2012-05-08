class Api::AuthenticationController < Api::ApiController

  # POST /api/auth/request_token
  def request_token
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:pass])
      render :request_token
    else
      render text: "Mot de passe ou nom d'utilisateur incorrect", status: 403
    end
  end

  def unauthorized_access
    show_error "Authentification requise", 401
  end
end
