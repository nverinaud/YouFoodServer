module ApplicationHelper

	# Returns the full title on a per-page basis.
	def fullTitle(page_title)
		base_title = "YouFood"
		if page_title.empty?
		  base_title
		else
		  "#{base_title} | #{page_title}"
		end
	end

end
