class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @products = Product.all
    @shops = Shop.all
    # @products = Product.page(params[:page]).per(PER)
  end
  
  def show
    @product = Product.find(params[:id])
    # @product_comment = ProductComment.find(params[:id])
    @shop = @product.shop
  end
    
  # def destroy
    # product = Product(params[:id])
    # product.destroy
    # redirect_to admin_products_path
  # end  
    
end
