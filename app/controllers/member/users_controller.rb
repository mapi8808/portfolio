class Member::UsersController < ApplicationController
  # メンバー会員（店員も）の内容

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def quit
  end

  def update
    @user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

  def goodbye
  end

  private

  def user_params
    params.require(:user).permit(:email, :name,)
  end


end