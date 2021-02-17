class ProductsController < ApplicationController
  # メンバーでなくても閲覧可能の商品詳細
  def index
    @products = Product.all
    @shops = Shop.all
  end

  def show
    @product = Product.find(params[:id])
    @shop = @product.shop
  end
end
