#encoding: utf-8

module Api::ApiHelper

  def valid_token?
    if !authorized?
      redirect_to '/api/unauthorized'
    end
  end

  def user_from_token_header
    token = request.headers["YouFoodServer-AccessToken"]
    User.find_by_remember_token(token) unless token.nil?
  end

  def current_user
    @current_user ||= user_from_token_header
  end

  def current_user=(user)
    @current_user = user
  end

  def authorized?
    !current_user.nil?
  end

  def show_error(error, status)
    render json: {error: error}, status: status
  end
end
