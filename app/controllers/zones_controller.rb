#encoding: utf-8

class ZonesController < ApplicationController
  include RestaurantsHelper
  before_filter :signed_in_manager, :get_restaurant, :valid_restaurant?

  # GET /zones/
  def index
    @zones = @restaurant.zones
  end


  # GET zones/:id/edit
  def edit
    begin
      @zone = Zone.find(params[:id])
      @tables = @restaurant.tables
      @waiters = @restaurant.waiters
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "La zone ##{params[:id]} n'existe pas."
      redirect_to zones_path
    end
  end

  # PUT /zones/:id
  def update
    @zone = Zone.find(params[:id])
    get_tables_from_params
    if (@zone.update_attributes(params[:zone]))
      flash[:success] = "La zone \"#{@zone.name}\" a été mise à jour !"
      redirect_to zones_path
    else
      flash[:error] = "Une erreur est survenue. Essayez à nouveau."
      @tables = @restaurant.tables
      @waiters = @restaurant.waiters
      render 'edit'
    end
  end

  # GET /zones/new
  def new
    @zone = Zone.new
    @tables = @restaurant.tables
    @waiters = @restaurant.waiters
  end

  #POST /zones/create
  def create
    @zone = Zone.new(params[:zone])
    @zone.restaurant = @restaurant
    get_tables_from_params
    if @zone.save
      flash.now[:success] = "La zone #{@zone.name} a été crée avec succès."
      redirect_to zones_path
    else
      flash.now[:error] = "Une erreur est survenue."
      @tables = @restaurant.tables
      @waiters = @restaurant.waiters
      render new_zone_path
    end
  end

  # DELETE /zones/:id
  def destroy
    zone = Zone.find(params[:id])
    if zone.destroy
      flash[:success] = "La zone \"#{zone.name}\" a été supprimée."
      redirect_to zones_path
    else
      flash[:error] = "La zone n'existe pas."
      redirect_to zones_path
    end
  end

  private
  def get_tables_from_params
    @zone.tables = Table.find(params[:tables_id].split(','))
  end
end