# encoding: UTF-8

class Api::CallWaiterController < Api::ApiController

	before_filter :valid_token?

	def call_waiter
		table_id = params[:table_id]
		if table_id
			
		else
			show_error "Argument 'table_id' manquant.", 403
		end
	end

end