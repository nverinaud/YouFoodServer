# encoding: utf-8

class RestaurantsController < ApplicationController

  before_filter :signed_in_director, only: [:index]
  before_filter :authorized_manager_or_director, only: [:employees]

  # GET /restaurants
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end


  # GET /restaurants/:id/employees
  def employees
  	@employees = @restaurant.employees
  end


private

		def authorized_manager_or_director
			signed_in_user
			@restaurant = Restaurant.find(params[:id])
			#if !signed_in_director? || !( signed_in_manager? && current_user.restaurant?(@restaurant) )
			unless signed_in_manager? && current_user.restaurant == @restaurant
				flash[:error] = "Accès non autorisé."
				redirect_to root_path
			end
		end

end
