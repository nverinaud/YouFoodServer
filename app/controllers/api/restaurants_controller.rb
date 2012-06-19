class Api::RestaurantsController < Api::ApiController
  include RestaurantsHelper
  include Api::ApiRestaurantHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?
  before_filter :api_valid_zone?, only: [:zones]

  #GET /api/zones
  def zones
    render :zones
  end

  #GET /api/tables
  def tables
    @tables = @restaurant.tables
    render :tables
  end
end
