# encoding: utf-8
module ProductsHelper

	def product_image_tag(product)
		imgURL = "food-image.jpg"
		unless product.photoURL.blank?
			imgURL = product.photoURL
		end

		image_tag(imgURL, alt: "Photo for #{product.name}")
	end

	def product_humanize_permanent(product)
		if product.permanent?
			"Toujours à la carte"
		else
			"À thème"
		end
	end

end
