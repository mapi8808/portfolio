class Member::UsersController < ApplicationController
  # メンバー会員（店員も）の内容

  def show
    @user = User.find(params[:id])
    @shop = @user.shop
    # 店舗ユーザーが登録した店舗情報
  end

  def edit
    @user = User.find(params[:id])
    @shop = @user.shop
    # 店舗ユーザーが登録した店舗情報
  end

  def quit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def goodbye
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :user_status, :admin_flag)
  end


end
