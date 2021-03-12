class ApplicationController < ActionController::Base
  # 登録時の登録情報追加（deviseのデフォルトはメール、パス）
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
# ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可される
# admin_flagを追加して、記録を残すようにした。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin_flag])
  end

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      root_path
    elsif current_user.admin_flag == @user.shop.present?
      root_path
    elsif current_user.admin_flag == true
      new_shop_path  # ログイン後に遷移するpathを設定
    else current_user.admin_flag == false
      root_path
    end
  end

end
