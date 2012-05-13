#encoding: utf-8

class TablesController < ApplicationController
  include RestaurantsHelper
  before_filter :signed_in_manager, :get_restaurant, :valid_restaurant?

  #GET /tables/
  def index
    @tables = @restaurant.tables
  end

  # GET /tables/new
  def new
    @table = Table.new
    @zones = @restaurant.zones
  end

  def create
    @table = Table.new(params[:table])
    @table.restaurant = @restaurant
    if @table.save
      flash.now[:success] = "La table #{@table.name} a été crée avec succès."
      redirect_to tables_path
    else
      flash.now[:error] = "Une erreur est survenue."
      @zones = @restaurant.zones
      render new_table_path
    end
  end
end
