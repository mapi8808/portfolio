class Admin::ShopsController < ApplicationController
  # 未ログインで、管理者の画面にアクセスするとログイン画面へ
  before_action :authenticate_admin!

  def index
    @shops = Shop.all
  end
  
  def show
    @shop = Shop.find(params[:id])
    @user = @shop.user
  end
  
end
