class EmployeesController < ApplicationController

	before_filter :signed_in_manager
	before_filter :get_restaurant

  def index
  	@employees = @restaurant.employees
  end

private

	def get_restaurant
		@restaurant = current_user.restaurant
	end

end
