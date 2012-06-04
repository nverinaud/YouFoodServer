#encoding: utf-8

class ZonesController < ApplicationController
  include RestaurantsHelper
  before_filter :signed_in_manager, :get_restaurant, :valid_restaurant?

  # GET /zones/
  def index
    @zones = @restaurant.zones
  end

  # GET /zones/new
  def new
    @zone = Zone.new
    @tables = @restaurant.tables
  end

  #POST /zones/create
  def create
    @zone = Zone.new(params[:zone])
    @zone.tables << Table.find(params[:tables_id].split(','))
    @zone.restaurant = @restaurant
    if @zone.save
      flash.now[:success] = "La zone #{@zone.name} a été crée avec succès."
      redirect_to zones_path
    else
      flash.now[:error] = "Une erreur est survenue."
      @tables = @restaurant.tables
      render new_zone_path
    end
  end
end