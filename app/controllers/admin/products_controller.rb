class Admin::ProductsController < ApplicationController
    
  def index
    @products = Product.page(params[:page]).reverse_order
    @shops = Shop.all
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
