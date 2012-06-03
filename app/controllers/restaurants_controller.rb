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

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @restaurant.restaurant_manager = RestaurantManager.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    manager = @restaurant.restaurant_manager

    if manager.save # this step is required since manager does not have an id yet
      manager.reload
      @restaurant.restaurant_manager = manager
      if @restaurant.save
        flash[:success] = "Restaurant créé avec succès !"
        redirect_to @restaurant
      else
        @restaurant.restaurant_manager.destroy
        render 'new'
      end
    else
      render 'new'
    end
  end

end
