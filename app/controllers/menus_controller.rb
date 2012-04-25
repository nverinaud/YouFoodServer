class MenusController < ApplicationController

  # GET /menus/
  def index
    @menus = Menu.paginate(page: params[:page])
  end

  # GET /menus/:id
  def show
    
  end
end
