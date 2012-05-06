class RestaurantsController < ApplicationController
  before_filter :signed_in_director

  # GET /restaurants
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end
end
