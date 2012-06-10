class OrdersController < ApplicationController
	include RestaurantsHelper

	before_filter :signed_in_cooker, :get_restaurant, :valid_restaurant?

	# GET /orders
  def index
  	@invoices = @restaurant.invoices.where(state: 1)
  end

end
