class Member::UsersController < ApplicationController
  # メンバー会員（店員も）の内容
  # 未ログインで、詳細以外の画面にアクセスするとログイン画面へ
  before_action :authenticate_user!,except: [:show]

  def show
    @user = User.find(params[:id])
    @shop = @user.shop
    # 店舗ユーザーが登録した店舗情報
  end

  def edit
    @user = User.find(params[:id])
    @shop = @user.shop # 店舗ユーザーが登録した店舗情報
    if current_user.id # 登録したログインユーザーが同じ人以外、直接URLにとんでも、home画面にいくように。
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:update] = "ユーザー情報を更新しました"
    redirect_to user_path
    else
      @users = User.find(params[:id])
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :user_status, :admin_flag)
  end


end
