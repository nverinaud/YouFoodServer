class MenusController < ApplicationController
  def index
    @menus = Menu.paginate(page: params[:page])
  end
end
