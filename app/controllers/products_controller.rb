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
    @categories = Category.select(:name).map { |c| c.name };
    @product = session[:product] || Product.new
    session[:product] = nil
  end

  # POST /products
  def create
    params[:product][:category] = nil
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_path
    else
      session[:product] = @product
      redirect_to new_product_path      
    end
  end

end
