# encoding: utf-8

class Api::ZonesController < Api::ApiController
  include RestaurantsHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?

  #GET /api/zones
  def zones

    render :zones
  end
end
