class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page]).reverse_order
    @shops = Shop.all
  end
  
  def show
    @user = User.find(params[:id])
    @shop = @user.shop
  end
  
end
