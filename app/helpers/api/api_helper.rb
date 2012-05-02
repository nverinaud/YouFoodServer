module Api::ApiHelper
  def valid_token?
    User.find_by_remember_token(request.headers['YouFoodServer-AccessToken']).nil?
  end
end
