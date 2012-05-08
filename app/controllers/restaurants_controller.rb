# encoding: utf-8

class RestaurantsController < ApplicationController

  before_filter :signed_in_director, only: [:index]

  # GET /restaurants
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end

  # GET /restaurants/:id
  def show
    begin
      @restaurant = Restaurant.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Le restaurant ##{params[:id]} n'existe pas."
      redirect_to restaurants_path
    end
  end
end
