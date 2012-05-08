# encoding: utf-8

class RestaurantsController < ApplicationController

  before_filter :signed_in_director, only: [:index]

  # GET /restaurants
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end

end
