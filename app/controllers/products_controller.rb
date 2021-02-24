class ProductsController < ApplicationController
  # メンバーでなくても閲覧可能の商品詳細
  before_action :authenticate_user!,except: [:index]
  
  def index
    @products = Product.all
    @shop = Shop.name
  end

  def show
    @product = Product.find(params[:id])
    @shop = @product.shop
  end
  
   private

  def product_params
    params.require(:product).permit(:product_name, :image, :body, :amounts, :shop_id, :genre_id)
  end
end
