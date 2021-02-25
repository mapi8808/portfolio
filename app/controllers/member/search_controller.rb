class Member::SearchController < ApplicationController
  
  def search
    @shop_or_product = params[:option]
    if @shop_or_product == "1" #店舗を選んだ時、店舗のパラメーター内容を探す。 
      @shops = Shop.search(params[:search], params[:choice], @shop_or_product)
    else
      @products = Product.search(params[:search], params[:choice], @shop_or_product)
      #商品を選んだ時、商品のパラメーター内容を探す。
    end
  end
end
