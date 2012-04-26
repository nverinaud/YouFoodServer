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
    @products_names = Array.new
    Product.all.each do |product|
      @products_names << product.name
    end
    @schedule_options = Array.new
    Schedule.all.each do |schedule|
      @schedule_options << ["Semaine #{schedule.week}", schedule.id]
    end
  end
end
