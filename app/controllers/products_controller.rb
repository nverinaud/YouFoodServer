class ProductsController < ApplicationController

	# GET /products
  def index
  	@products = Product.paginate(page: params[:page])
  end

  # GET /products/:id
  def show
  	begin
  		@product = Product.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
  		flash[:error] = "Le produit ##{params[:id]} n'existe pas."
  		redirect_to products_path
  	end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products
  def create
  end

end
