class Api::AuthenticationController < Api::ApiController

  # POST /api/auth/request_token
  def request_token
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:pass])
      if @user.is_a?(Waiter) && !params[:push_url].blank?
        if !@user.update_attribute :push_url, params[:push_url]
          show_error "Erreur d'authentification (0x09255619924018264087)", 500
          return
        end
      end
      render :request_token
    else
      show_error "Mot de passe ou nom d'utilisateur incorrect", 403
    end
  end

  def unauthorized_access
    show_error "Authentification requise", 401
  end
end
