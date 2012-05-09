class ZonesController < ApplicationController
  before_filter :signed_in_manager

  # GET /zones/
  def index
    @zones = current_user.restaurant.zones
  end
end
