class PortalController < ApplicationController
  before_filter :signed_in_director, only: :director
  before_filter :signed_in_manager, except: :director

  def director
  end

  def restaurant_manager
  end

  def room
  end
end
