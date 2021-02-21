class Member::SearchController < ApplicationController
  
  def search
    @shop_or_product = params[:option]
    if @shop_or_product == "1"
      @shops = Shop.search(params[:search], params[:choice], @shop_or_product)
    else
      @products = Product.search(params[:search], params[:choice], @shop_or_product)
    end
  end
end
