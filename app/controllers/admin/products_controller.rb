class Admin::ProductsController < ApplicationController
  # 未ログインで、管理者の画面にアクセスするとログイン画面へ
  before_action :authenticate_admin!
    
  def index
    @products = Product.page(params[:page]).reverse_order
    @shops = Shop.all
    @genres = Genre.all
  end
  
  def show
    @product = Product.find(params[:id])
    # @product_comment = ProductComment.find(params[:id])
    @shop = @product.shop
    @genre = @product.genre
  end
    
  # def destroy
    # product = Product(params[:id])
    # product.destroy
    # redirect_to admin_products_path
  # end  
    
end
