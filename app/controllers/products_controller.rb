class ProductsController < ApplicationController
  
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
  end
  
  private
  
  def product_params
    params.require(:product).permit(:product_name, :image, :body, :amounts)
  end
    
end
