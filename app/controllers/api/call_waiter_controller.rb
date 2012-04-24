# encoding: UTF-8

class Api::CallWaiterController < Api::ApiController

	def call_waiter
		if authorized?
			table_id = params[:table_id]
			if table_id

			else
				show_error "Argument 'table_id' manquant.", 403
			end
		else
			show_error "Acces non autorisé.", 401
		end
	end


	private

		def show_error(error, status)
			render json: { error: error }, status: status
		end

end