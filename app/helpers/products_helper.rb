# encoding: utf-8
module ProductsHelper

	def product_image_tag(product)
		image_tag(product.photo.url, alt: "Photo for #{product.name}")
	end

	def product_humanize_permanent(product)
		if product.permanent?
			"Toujours à la carte"
		else
			"À thème"
		end
	end

end
