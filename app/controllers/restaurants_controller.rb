# encoding: utf-8 
class RestaurantsController < ApplicationController
  before_filter :signed_in_director
  before_filter :manager_from_params, only: [:create]

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
    @restaurant = session[:restaurant] || Restaurant.new
    session[:restaurant] = nil
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.restaurant_manager = @manager

    if @manager.valid? && @restaurant.valid?
      @manager.save
      @restaurant.save
      flash[:success] = "Restaurant créé avec succès !"
      redirect_to @restaurant
      return
    end

    @restaurant.errors[:manager_name] = @manager.errors[:name]
    @restaurant.errors[:manager_email] = @manager.errors[:email]
    @restaurant.errors[:manager_password] = @manager.errors[:password]
    @restaurant.errors[:manager_password_confirmation] = @manager.errors[:password_confirmation]
    render 'new'
  end

private

  def manager_from_params
    @manager = RestaurantManager.new
    @manager.name = params[:restaurant][:manager_name]
    @manager.email = params[:restaurant][:manager_email]
    @manager.password = params[:restaurant][:manager_password]
    @manager.password_confirmation = params[:restaurant][:manager_password_confirmation]

    params[:restaurant].delete :manager_name
    params[:restaurant].delete :manager_email
    params[:restaurant].delete :manager_password
    params[:restaurant].delete :manager_password_confirmation
  end

end
