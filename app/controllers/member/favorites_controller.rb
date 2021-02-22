class Member::FavoritesController < ApplicationController
  # メンバー会員（店員）の内容、いいねするにはメンバー登録要
  
  def create
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.new(product_id: @product.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
    redirect_to request.referer
  end
  
end
