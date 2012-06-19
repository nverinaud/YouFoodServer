class Api::RestaurantsController < Api::ApiController
  include RestaurantsHelper
  include Api::ApiRestaurantHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?

  #GET /api/zones
  def zones
   	@zones = []
  	if(current_user.is_a? Waiter) && (current_user.zone)
  		logger.debug current_user.zone
  		@zones << current_user.zone
		elsif(current_user.is_a? RestaurantManager)
  		@zones = @restaurant.zones
		end
    render :zones
  end

  #GET /api/tables
  def tables
    @tables = @restaurant.tables
    render :tables
  end
end
