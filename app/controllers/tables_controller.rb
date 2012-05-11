class TablesController < ApplicationController
  include RestaurantsHelper
  before_filter :signed_in_manager, :get_restaurant

  #GET /tables/
  def index
    @tables = @restaurant.tables
  end
end
