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

  # GET /restaurant/employees/new
  def new
  	@employee = session[:employee] || User.new
  	session[:employee] = nil
  end

  # POST /restaurant/employees
  def create
  	type = params[:employee][:type]
  	params[:employee][:type] = nil
  	
  	if !type.nil?
  		
  		@employee = nil
  		
  		if type == "Cuisto"
  			@employee = @restaurant.cookers.build(params[:employee])
  		elsif type == "Serveur"
  			@employee = @restaurant.waiters.build(params[:employee])
  		end

  		if !@employee.nil?
  			if @employee.save
  				flash[:success] = "Nouvel employé \"#{@employee.name}\" créé !"
  				redirect_to employee_path(@employee)
  				return
  			end
  		end
  	end

  	employee = @employee || User.new(params[:employee])
  	employee.valid?
  	session[:employee] = employee
  	redirect_to new_employee_path
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
		redirect_to current_user_portal_path
	end

end
