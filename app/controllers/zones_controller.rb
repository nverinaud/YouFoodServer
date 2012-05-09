#encoding: utf-8

class ZonesController < ApplicationController
  before_filter :signed_in_manager

  # GET /zones/
  def index
    if (current_user.restaurant)
      @zones = current_user.restaurant.zones
    else
      flash[:error] = "Vous n'êtes affecté à aucun restaurant."
      redirect_to root_path
    end
  end
end
