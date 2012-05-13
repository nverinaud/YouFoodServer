class Api::RestaurantsController < Api::ApiController
  include RestaurantsHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?

  #GET /api/zones
  def zones
    @zones = @restaurant.zones
    render :zones
  end

  #GET /api/tables
  def tables
    @tables = @restaurant.tables
    render :tables
  end
end
