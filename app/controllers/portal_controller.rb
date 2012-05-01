class PortalController < ApplicationController
  before_filter :signed_in_director, only: :director
  before_filter :signed_in_manager, only: :restaurant_manager

  def director
  end

  def restaurant_manager
  end
end
