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
    logger.debug @menu
    @menu ||= Menu.new
    logger.debug @menu.name
    @products = Product.select("name, id")
    @schedules = Schedule.select("week, id, menu_id")
  end

  # POST /menus/create
  def create
    @menu = Menu.new(params[:menu])
    @menu.products << Product.find(params[:products_id].split(','))
    @menu.schedules << Schedule.find(params[:schedules_id].split(','))
    if @menu.save
      redirect_to menus_path
    else
      logger.debug @menu.errors
      flash.now[:error] = "Une erreur est survenue."
      render new_menu_path
    end
  end
end
