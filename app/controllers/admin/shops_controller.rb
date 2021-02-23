class Admin::ShopsController < ApplicationController
  

  def index
    @shops = Shop.all
  end
  
  def show
    @shop = Shop.find(params[:id])
    @user = @shop.user
  end
  
end
