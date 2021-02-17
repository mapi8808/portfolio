class Admin::ProductsController < ApplicationController
    
  def index
    @products = Product.all
    @shops = Shop.all
    # @products = Product.page(params[:page]).per(PER)
  end
  
  def show
    @product = Product.find(params[:id])
    @product_comment = ProductComment.find(params[:id])
    @shop = Shop.find(params[:id])
  end
    
end
