class Admin::UsersController < ApplicationController
  # 未ログインで、管理者の画面にアクセスするとログイン画面へ
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page]).reverse_order
    @shops = Shop.all
  end
  
  def show
    @user = User.find(params[:id])
    @shop = @user.shop
  end
  
end
