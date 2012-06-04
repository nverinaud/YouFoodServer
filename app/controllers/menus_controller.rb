# encoding: utf-8

class MenusController < ApplicationController
  before_filter :signed_in_director

  # GET /menus/
  def index
    @menus = Menu.paginate(page: params[:page])
  end

  # GET /menus/:id
  def show
    begin
      @menu = Menu.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Le menu ##{params[:id]} n'existe pas."
      redirect_to menus_path
    end
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    load_products_schedules
  end

  # POST /menus/create
  def create
    @menu = Menu.new(params[:menu])
    get_products_schedules_from_params
    if @menu.save
      redirect_to menus_path
    else
      flash.now[:error] = "Une erreur est survenue."
      load_products_schedules
      render new_menu_path
    end
  end

  # GET /menus/:id/edit
  def edit
    begin
      @menu = Menu.find(params[:id])
      load_products_schedules
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Le menu ##{params[:id]} n'existe pas."
      redirect_to menus_path
    end
  end

  # PUT /menus/:id
  def update
    @menu = Menu.find(params[:id])
    get_products_schedules_from_params
    if (@menu.update_attributes(params[:menu]))
      flash[:success] = "Le menu \"#{@menu.name}\" a été mis à jour !"
      redirect_to @menu
    else
      flash[:error] = "Une erreur est survenue. Essayez à nouveau."
      load_products_schedules
      render 'edit'
    end
  end

  # DELETE /menus/:id
  def destroy
    menu = Menu.find(params[:id])
    if menu.destroy
      flash[:success] = "Le menu \"#{menu.name}\" a été supprimé."
      redirect_to menus_path
    else
      flash[:error] = "Le menu n'existe pas."
      redirect_to menu_path
    end
  end

  private
  def load_products_schedules
    @products = Product.where(permanent: false).select("name, id")
    @schedules = Schedule.select("week, id, menu_id")
  end

  def get_products_schedules_from_params
    @menu.products = Product.find(params[:products_id].split(','))
    @menu.schedules = Schedule.find(params[:schedules_id].split(','))
  end
end
