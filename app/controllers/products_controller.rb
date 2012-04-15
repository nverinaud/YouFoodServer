class ProductsController < ApplicationController

	# GET /products
  def index
  	@products = Product.all
  end

end
