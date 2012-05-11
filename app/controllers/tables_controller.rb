class TablesController < ApplicationController
  include RestaurantsHelper
  before_filter :get_restaurant

  #GET /tables/
  def index
    @tables = @restaurant.tables
  end
end
