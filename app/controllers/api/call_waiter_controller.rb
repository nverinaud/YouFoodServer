# encoding: UTF-8

class Api::CallWaiterController < Api::ApiController

	before_filter :valid_token?

	def call_waiter
		table_id = params[:table_id]
		
		if !table_id
			show_error "Argument 'table_id' manquant.", 412
			return
		end

		table = Table.find(table_id)
		if !table
			show_error "Aucune table avec id #{table_id}.", 500
			return
		end

		waiter = table.waiter
		if !waiter
			show_error "Aucun serveur ne gère la table ##{table_id}.", 500
			return
		end

		if !waiter.push_url
			show_error "Impossible de contacter le serveur #{waiter.id}.", 500
			return
		end

		options = {
			type: 1,
			table_id: table.id
		}

		response = MicrosoftPushNotificationService.send_notification waiter.push_url, :raw, options

		if !response.is_a? Net::HTTPSuccess
			show_error "Le serveur n'est pas joignable.", response.code
		else
			render json: {message: "Le serveur a été contacté. Veuillez patienter..."}, status: 200
		end
	end

end