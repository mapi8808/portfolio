class Admin::ShopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shops = Shop.all
  end
  
  def show
    @shop = Shop.find(params[:id])
    @user = @shop.user
  end
  
end
