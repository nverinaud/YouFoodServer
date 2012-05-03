module Api::ApiHelper
  def valid_token?
    if User.find_by_remember_token(request.headers['YouFoodServer-AccessToken']).nil?
      redirect_to '/api/unauthorized'
    end
  end
end
