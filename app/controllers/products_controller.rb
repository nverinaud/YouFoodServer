class ProductsController < ApplicationController

  before_filter :signed_in_director
  
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
    categoryName = params[:product][:category];
    params[:product][:category] = nil;
    category = nil
    if !categoryName.blank?
      category = Category.where(name: categoryName).first_or_create
      product = category.products.build(params[:product])
      if product.save
        redirect_to products_path
      else
        if !category.nil?
          product.category = Category.new(name: category.name)
          if category.products.count == 0
            category.delete
          end
        end
        product.photo = nil
        session[:product] = product
        redirect_to new_product_path
      end
    else
      product = Product.new(params[:product])
      product.valid?
      product.photo = nil
      session[:product] = product
      redirect_to new_product_path
    end
  end

end
