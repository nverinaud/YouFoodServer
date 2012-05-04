class RestaurantsController < ApplicationController

# GET /restaurants
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end
end
