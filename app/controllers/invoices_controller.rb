#encoding: utf-8

class InvoicesController < ApplicationController
	include RestaurantsHelper

	before_filter :signed_in_cooker, :get_restaurant, :valid_restaurant?

	# GET /restaurant/invoices
  def index
  	@invoices = @restaurant.invoices.where(state: 1)
  end

  # GET /restaurant/invoices/:invoice_id/call-waiter/:table_id
  def call_waiter
  	table = Table.find(params[:table_id])

  	waiter = table.waiter
  	if !waiter
  		render json: {error: "Aucun serveur ne gère cette table."}, status: 500
  		return
  	end

  	if !waiter.push_url
  		render json: {error: "Le serveur est injoignable."}, status: 500
  		return
  	end

  	options = {
  		type: 2,
  		invoice_id: params[:invoice_id]
  	}

  	response = MicrosoftPushNotificationService.send_notification waiter.push_url, :raw, options

  	if !response.is_a? Net::HTTPSuccess
			render json: {error: "Le serveur est injoignable."}, status: response.code
			return
		end

  	render nothing: true, status: 200
  end

end
