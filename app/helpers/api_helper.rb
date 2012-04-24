module ApiHelper

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

end