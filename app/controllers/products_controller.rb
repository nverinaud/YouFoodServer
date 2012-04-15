class ProductsController < ApplicationController

	# GET /products
  def index
  	@products = Product.paginate(page: params[:page])
  end

end
