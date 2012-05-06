#encoding: utf-8

class ProductsController < ApplicationController

  before_filter :signed_in_director
  
	# GET /products
  def index
  	@products = Product.paginate(order: 'created_at DESC', page: params[:page])
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
    categories_as_autocomplete
    @product = session[:product] || Product.new
    session[:product] = nil
  end

  # GET /products/:id/edit
  def edit
    begin
      categories_as_autocomplete
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Le produit ##{params[:id]} n'existe pas."
      redirect_to products_path
    end
  end

  # POST /products
  def create
    category = category_from_params
    if !category.nil?
      @product = category.products.build(params[:product])
      if @product.save
        redirect_to products_path
      else
        if !category.nil?
          @product.category = Category.new(name: category.name)
          delete_category_if_needed(category)
        end
        categories_as_autocomplete
        render 'new'
      end
    else
      categories_as_autocomplete
      @product = Product.new(params[:product])
      @product.valid?
      render 'new'
    end
  end


  # PUT /products/:id
  def update
    category = category_from_params
    params[:product][:category] = category
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:success] = "Le produit \"#{@product.name}\" a été mis à jour !"
      redirect_to @product
    else
      delete_category_if_needed(category)
      categories_as_autocomplete
      render 'edit'
    end
  end


  # DELETE /products/:id
  def destroy
    product = Product.find(params[:id])
    if product.destroy
      flash[:success] = "Le produit \"#{product.name}\" a été supprimé."
      redirect_to products_path
    else
      flash[:error] = "Le produit n'existe pas."
      redirect_to products_path
    end
  end


  private

    def categories_as_autocomplete
      @categories = Category.select(:name).map { |c| c.name }
    end

    def category_from_params
      categoryName = params[:product][:category];
      params[:product][:category] = nil;
      category = nil
      if !categoryName.blank?
        category = Category.where(name: categoryName).first_or_create
      end
      return category
    end

    def delete_category_if_needed(category)
      if category.products.count == 0
        category.delete
      end
    end

end
