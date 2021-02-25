class HomesController < ApplicationController
  # トップ画面
  def top
    @products = Product.all
    @shops = Shop.all
  end
  
  # サイト概要・作成経緯
  def about
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(available: false)
    reset_session
    redirect_to root_path
  end


end
