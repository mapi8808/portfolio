class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @shops = Shop.all
  end
  
  def show
    @user = User.find(params[:id])
    @shop = @user.shop
  end
  
end
