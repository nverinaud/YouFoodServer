# encoding: utf-8

class EmployeesController < ApplicationController
	include EmployeesHelper

	before_filter :signed_in_manager
	before_filter :get_restaurant
	before_filter :valid_employee, only: [:show, :update, :destroy]


	# GET /restaurant/employees
  def index
  	@employees = @restaurant.employees
  end

  # GET /restaurant/employees/:id
  def show
  end

private

	def get_restaurant
		@restaurant = current_user.restaurant
	end

	def valid_employee
		user = User.find(params[:id])
		if user_is_an_employee?(user)
			if user.restaurant == @restaurant
				@employee = user
				return
			end
		end
		flash[:error] = "Vous n'avez pas accès à cet employé."
		redirect_to root_path
	end

end
