class Member::ShopsController < ApplicationController
  # メンバー会員（店舗情報）の内容

  # def show
    # @shop = Shop.find(params[:id])
    # @user = @shop.user
  # end

  def edit
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    # 店舗を登録した店舗管理者とログインユーザーが一緒なら
    @shop.save
    redirect_to root_path
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to user_path(current_user.id)
    # ログインしているユーザー
  end

  def destroy
    shop = Shop(params[:id])
    shop.destroy
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :url, :address, :tel, :hours, :holiday, :admin_email, :user_id)
  end

end
