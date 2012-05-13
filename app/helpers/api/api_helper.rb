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

  def user
    @user ||= user_from_token_header
  end

  def user=(user)
    @user = user
  end

  def authorized?
    !user.nil?
  end

  def show_error(error, status)
    render json: {error: error}, status: status
  end

  def valid_restaurant?
    if (!@restaurant)
      show_error "Vous ne pouvez pas acceder à cette ressouce.", 401
    end
  end
end
