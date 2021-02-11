class Member::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    product.save
    redirect_to product_path
  end
  
  def update
    @product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product_path
  end
  
  def destroy
    product = Product(params[:id])
    product.destroy
    redirect_to products_path
  end
  
  private
  
  def product_params
    params.require(:product).permit(:product_name, :image, :body, :amounts)
  end
    
end
