class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    @products = Product.find_all_by_name(params[:name])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params.require(:product)
                                 .permit(:name, :description, :cost, :stock))
    if @product.save
      redirect_to @product, notice: "Product has been successfully created."
    else 
      render action: "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params.require(:product)
                                 .permit(:name, :description, :cost, :stock))
      redirect_to @product, notice: 'Product was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Product was successfully deleted."
  end

end
