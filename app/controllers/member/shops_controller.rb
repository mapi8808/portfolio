class Member::ShopsController < ApplicationController
  # メンバー会員（店舗情報）の内容
  # 未ログインで、shop関連画面にアクセスするとログイン画面へ
  before_action :authenticate_user!

  def show
    @shop = Shop.find(params[:id])
    @user = @shop.user
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user == current_user  # ログインユーザーと店舗登録したユーザーが同じ人以外、直接URLにとんでも、home画面にいくように。
      render :edit
    else
      redirect_to root_path
    end
  end

  def new
    @shop = Shop.new
    if current_user # ログインユーザー以外、直接URLにとんでも、home画面にいくように。 
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    # 店舗を登録した店舗管理者とログインユーザーが一緒なら
    if @shop.save
    flash[:shopup] = "店舗情報を登録しました" 
    redirect_to root_path
    else
      @shops = Shop.all
      render :new
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
    flash[:shopup] = "店舗情報を更新しました"
    redirect_to user_path(current_user.id) # ログインしているユーザー
    else
      @shops = Shop.find(params[:id])
      render :edit
    end
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
