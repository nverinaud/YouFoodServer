class MenusController < ApplicationController
  # before_filter :signed_in_director

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
    @products_names = Product.select("name, id")
    @schedule_options = Array.new
    Schedule.all.each do |schedule|
      @schedule_options << ["Semaine #{schedule.week}", schedule.id]
    end
  end

  # POST /menus/create
  def create
    menu = Menu.new(params[:menu])
    menu.products << Product.find(params[:products_id].split(','));
    if menu.save
      redirect_to menus_path
    else
      flash.now[:error] = "Une erreur est survenue."
      redirect_to new_product_path
    end
  end
end
