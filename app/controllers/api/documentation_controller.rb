class Api::DocumentationController < Api::ApiController
	
	def index
		render layout: "api/documentation"
	end

end